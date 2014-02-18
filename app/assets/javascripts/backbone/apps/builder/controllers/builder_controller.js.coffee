NominaApp.module "BuilderApp", (BuilderApp, NominaApp, Backbone, Marionette, $, _) ->
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

  BuilderApp.Controller = builder: ->
    builderLayout = new BuilderApp.Views.Layout()
    builderPanel = new BuilderApp.Views.Panel()
    builderContent = new BuilderApp.Views.Content()

    builderPanel.on "builder:parse:file", (files) ->
      API.parser(files)
      

    builderLayout.on "show", ->
      builderLayout.panelRegion.show builderPanel
      builderLayout.contentRegion.show builderContent

    BuilderApp.on "update:progress:parser", (percentage) ->
      builderPanel.trigger "update:progress", percentage

    NominaApp.mainRegion.show builderLayout
