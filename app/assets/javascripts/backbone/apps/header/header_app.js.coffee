NominaApp.module "HeaderApp", (HeaderApp, NominaApp, Backbone, Marionette, $, _) ->
  HeaderApp.on "start", ->
    HeaderApp.List.Controller.listHeader()
