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

    events:
      "click #send-js": "sendToServer"

    ui:
      sendButton: "#send-js"

    initialize: ->
      console.log "Linitialize content..."

    sendToServer: (e) ->
      if @collection.length > 0
        #Pendiente, acá es donde se hará (o se llamará) el proceso para enviar los datos al servidor...
        console.log( @collection.toJSON() )
      else
        NominaApp.trigger "show:alert", "No existe informacion para enviar al servidor", "danger"
        

    toggleSendButton: (active) ->
      if active
        @ui.sendButton.removeAttr("disabled")
      else
        @ui.sendButton.attr("disabled", "disabled")


