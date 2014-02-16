NominaApp.module "BuilderApp", (BuilderApp, NominaApp, Backbone, Marionette, $, _) ->
  class BuilderApp.Router extends Marionette.AppRouter
    appRoutes:
      "builder": "builder"
