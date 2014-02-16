NominaApp.module "BuilderApp", (BuilderApp, NominaApp, Backbone, Marionette, $, _) ->
  BuilderApp.Controller = builder: ->
    builderLayout = new BuilderApp.Views.Layout()
    builderPanel = new BuilderApp.Views.Panel()
    builderContent = new BuilderApp.Views.Content()

    builderPanel.on "builder:parse:file", (file) ->
      console.log("Aca es donde se hará el parser del archivo ")

    builderLayout.on "show", ->
      builderLayout.panelRegion.show builderPanel
      builderLayout.contentRegion.show builderContent

    NominaApp.mainRegion.show builderLayout
