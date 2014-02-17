NominaApp.module "BuilderApp.Views", (Views, NominaApp, Backbone, Marionette, $, _) ->
  NoDataView = Marionette.ItemView.extend(
    template: "builder/none_data"
    tagName: "tr"
  )

  class Views.Rowview extends Marionette.ItemView
    template: "builder/row_view"
    tagName: "tr"
    initialize: ->
      console.log "initialize row..."


  class Views.Content extends Marionette.CompositeView
    template: "builder/content"
    itemViewContainer: "tbody"
    itemView: Views.Rowview
    emptyView: NoDataView
    initialize: ->
      console.log "Linitialize content..."


