NominaApp.module "HeaderApp", (HeaderApp, NominaApp, Backbone, Marionette, $, _) ->
  HeaderApp.on "start", ->
    HeaderApp.List.Controller.listHeader()

  NominaApp.on "home:index", ->
    home_view = new HeaderApp.List.Views.Home()
    NominaApp.mainRegion.show home_view
    NominaApp.navigate "home"

