NominaApp.module "BuilderApp", (BuilderApp, NominaApp, Backbone, Marionette, $, _) ->

  BuilderApp.Controller = builder: ->
    builderLayout = new BuilderApp.Views.Layout()
    builderPanel = new BuilderApp.Views.Panel()
    builderContent = new BuilderApp.Views.Content( {collection: new Backbone.Collection()} )

    builderPanel.on "builder:parse:file", (files) ->
      builderContent.toggleSendButton(false)
      if API.valid_files(files)
        builderContent.collection.reset([])
        API.parser(files, builderLayout)

    builderContent.on "builder:timbrar", ->
      if @collection.length > 0
        builder = NominaApp.request "builder:timbrar", @collection.toJSON()
        $.when(builder).done (data) ->
          alert(data)
      else
        NominaApp.trigger "show:alert", "No existe informacion para enviar al servidor", "danger"

    builderLayout.on "show", ->
      console.log('Layout show...')
      builderLayout.panelRegion.show builderPanel
      builderLayout.contentRegion.show builderContent

    builderLayout.on "close", ->
      #This is to avoid memory leaks
      builderPanel.off()
      builderPanel.remove()
      builderContent .off()
      builderContent .remove()

    builderLayout.on "update:progress:parser", (percentage) ->
      builderPanel.trigger "update:progress", percentage

    builderLayout.on "builder:parser:done", (json) ->
      for comprobante_id of json
        builderContent.collection.add( new Backbone.Model(json[comprobante_id]) )

      builderContent.toggleSendButton(true)

    NominaApp.mainRegion.show builderLayout

  API =
    to_json: (workbook) ->
      result = {}
      workbook.SheetNames.forEach (sheetName) ->
        roa = XLS.utils.sheet_to_row_object_array(workbook.Sheets[sheetName])
        if roa.length > 0
          result[sheetName] = roa
      return result

    process_wb: (wb) ->
      XLS.SSF.load_table(wb.SSF) if typeof Worker isnt 'undefined'
      output = this.to_json(wb)
      output

    parser: (files, builderLayout) ->
      that = this
      json = {}
      i = 0
      while i isnt files.length
        f = files[i]
        reader = new FileReader()
        name = f.name
        reader.onloadstart = (e) ->
          builderLayout.trigger "update:progress:parser", 0
        reader.onload = (e) ->
          data = e.target.result
          cfb = XLS.CFB.read(data, {type: 'binary'})
          wb = XLS.parse_xlscfb(cfb)
          $.extend(json, that.process_wb(wb))
        reader.onprogress = (e) ->
          if e.lengthComputable
            percentLoaded = Math.round((e.loaded / e.total) * 100)
            if (percentLoaded < 100)
              builderLayout.trigger "update:progress:parser", percentLoaded
        reader.onloadend = (e) ->
          builderLayout.trigger "update:progress:parser", 100
          that.transform_data(json, builderLayout)

        reader.readAsBinaryString(f)
        i++

    #Esta función valida que los archivos que se quieran parsear, tengan el formato correcto xls
    valid_files: (files) ->
      valid = true
      if files
        _.each files, (file) ->
          if file.type isnt "application/vnd.ms-excel"
            valid = false
            NominaApp.trigger "show:alert", "Los archivos a parsear deben ser en formato xls", "danger"
      else
        valid = false
        NominaApp.trigger "show:alert", "No existen archivos a parsear", "danger"

      return valid

    push_data: (name_object, object_array, json_res)->
      if object_array and object_array.length isnt undefined
        _.each object_array, (object) ->
          id = object.id_comprobante
          if id  and json_res[id]
            if json_res[id][name_object]
              json_res[id][name_object].push object
            else
              json_res[id][name_object] = [ object ]
      else
        NominaApp.trigger "show:alert", "Formato incorrecto de achivo, no existe el elemeto " + name_object, "danger"

    #Esta función convertirá los datos (en json) que se obtienen del xls a la estructura (en json) que se enviará  
    transform_data: (json_xls, builderLayout) ->
      json_res = {}
      if json_xls.comprobantes and json_xls.comprobantes.length isnt undefined
        _.each json_xls.comprobantes, (comprobante) ->
          id = comprobante.id
          json_res[id] = comprobante
        
        this.push_data("conceptos", json_xls.conceptos, json_res)
        this.push_data("deduciones", json_xls.deducciones, json_res)
        this.push_data("horas_extras", json_xls.horas_extras, json_res)
        this.push_data("impuestos", json_xls.impuestos, json_res)
        this.push_data("incapacidades", json_xls.incapacidades, json_res)
        this.push_data("percepciones", json_xls.percepciones, json_res)

        builderLayout.trigger "builder:parser:done", json_res
      else
        NominaApp.trigger "show:alert", "Formato incorrecto de archivo, no existe el elemento comprobante", "danger"

