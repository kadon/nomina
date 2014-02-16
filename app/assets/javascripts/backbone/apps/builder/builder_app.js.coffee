NominaApp.module "BuilderApp", (BuilderApp, NominaApp, Backbone, Marionette, $, _) ->
  API =
    builder: () ->
      BuilderApp.Controller.builder()

  NominaApp.on "builder:index", ->
    NominaApp.navigate "builder"
    API.builder()

  NominaApp.addInitializer ->
    new BuilderApp.Router(controller: API)
