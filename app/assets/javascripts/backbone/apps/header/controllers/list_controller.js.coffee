NominaApp.module "HeaderApp.List", (List, NominaApp, Backbone, Marionette, $, _) ->
  List.Controller =
    listHeader: ->
      menu_options_collection = NominaApp.request("header:entities")
      headers_view = new List.Views.Headers(collection: menu_options_collection)

      headers_view.on "itemview:navigate", (childView, model) ->
        url = model.get("url")
        if url is "builder"
          NominaApp.trigger "builder:index"
        else
          throw "No such sub-application: " + url


      NominaApp.headerRegion.show headers_view

      headers_view.on "brand:clicked", ->
        NominaApp.trigger "home:index"
