NominaApp.module "BuilderApp", (BuilderApp, NominaApp, Backbone, Marionette, $, _) ->

  BuilderApp.Controller = builder: ->
    builderLayout = new BuilderApp.Views.Layout()
    builderPanel = new BuilderApp.Views.Panel()
    builderContent = new BuilderApp.Views.Content()

    builderPanel.on "builder:parse:file", (files) ->
      if API.valid_files(files)
        API.parser(files)

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

    BuilderApp.on "update:progress:parser", (percentage) ->
      builderPanel.trigger "update:progress", percentage

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

    parser: (files) ->
      that = this
      json = {}
      i = 0
      while i isnt files.length
        f = files[i]
        reader = new FileReader()
        name = f.name
        reader.onloadstart = (e) ->
          BuilderApp.trigger "update:progress:parser", 0
        reader.onload = (e) ->
          data = e.target.result
          cfb = XLS.CFB.read(data, {type: 'binary'})
          wb = XLS.parse_xlscfb(cfb)
          $.extend(json, that.process_wb(wb))
        reader.onprogress = (e) ->
          if e.lengthComputable
            percentLoaded = Math.round((e.loaded / e.total) * 100)
            if (percentLoaded < 100)
              BuilderApp.trigger "update:progress:parser", percentLoaded
        reader.onloadend = (e) ->
          BuilderApp.trigger "update:progress:parser", 100
          console.log('json')
          console.log(json)
        reader.readAsBinaryString(f)
        i++

    #Esta función valida que los archivos que se quieran parsear, tengan el formato correcto xls
    valid_files: (files) ->
      valid = true
      if files
        _.each files, (file) ->
          if file.type isnt "application/vnd.ms-excel"
            valid = false
            console.log("Los archivos a parsear deben tener ser en formato xls")
      else
        valid = false
        console.log('No existen archivos a parsear')

      return valid

    #Esta función convertirá los datos (en json) que se obtienen del xls a la estructura (en json) que se enviará  
    transform_data: (json_xls) ->
      json_res = {}
      if json_xls.comprobante
        _.each json_xls.comprobante, (comprobante) ->
          id = comprobante.id
          json_res[id]
          json_res.comprobante = comprobante
          comprobante.receptor = json_xls.receptor
          
      else
        console.log("No existe el elemento comprobante")

