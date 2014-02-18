NominaApp.module "BuilderApp.Views", (Views, NominaApp, Backbone, Marionette, $, _) ->
  class Views.Panel extends Marionette.ItemView
    template: "builder/panel"
    className: "panel-body"

    ui:
      inputFile: "#files-js"
      loadFilebutton: "#load-file-js"
      progressBar: "#progress-bar-js"

    events:
      "click #load-file-js": "load_file_data"

    initialize: ->
      @.on "update:progress", @updateProgress
      console.log "initialize panel..."

    load_file_data: (e)->
      e.stopPropagation()
      e.preventDefault()
      files = null
      if @ui.inputFile and @ui.inputFile[0] and @ui.inputFile[0].files
        files = @ui.inputFile[0].files

      @trigger "builder:parse:file", files

    updateProgress: (percentage)->
      @ui.progressBar.css('width', percentage + '%')
      @ui.progressBar.text( percentage + '%')
      console.log "Update progress" + percentage + '%'
