NominaApp.module "HeaderApp.List", (List, NominaApp, Backbone, Marionette, $, _) ->
  List.Controller =
    listHeader: ->
      menu_options_collection = NominaApp.request("header:entities")
      headers_view = new List.Views.Headers(collection: menu_options_collection)
      NominaApp.headerRegion.show headers_view

      headers_view.on "brand:clicked", ->
        NominaApp.trigger "home:index"
