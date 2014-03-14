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

    events:
      "click .send-js": "sendSingle"
      "click .cancel-js": "cancelSending"

    ui:
      sendButton: ".send-js"
      cancelButton: ".cancel-js"

    sendSingle: (e) ->
      send_btn = $(e.currentTarget)
      cancel_btn = @$el.find('.cancel-js')
      send_btn.button('loading')
      cancel_btn.removeAttr('disabled')

    cancelSending: (e)->
      e.stopPropagation()
      cancel_btn = $(e.currentTarget)
      send_btn = @$el.find('.send-js:disabled')
      send_btn.button('reset') if send_btn
      cancel_btn.attr('disabled', 'disabled')


  class Views.Content extends Marionette.CompositeView
    template: "builder/content"
    itemViewContainer: "tbody"
    itemView: Views.Rowview
    emptyView: NoDataView

    events:
      "click #send-js": "timbrar"
      "click #cancel-js": "cancelSending"

    ui:
      sendButton: "#send-js"
      cancelButton: "#cancel-js"

    initialize: ->
      console.log "Linitialize content..."

    timbrar: (e) ->
      e.stopPropagation()
      send_btn = $(e.currentTarget)
      send_btn.button('loading')

      spinner = new Spinner().spin()
      send_btn.find('i').append(spinner.el)


      @ui.cancelButton.removeAttr('disabled') if @ui.cancelButton.attr('disabled')
      @trigger "builder:timbrar"

    cancelSending: (e)->
      e.stopPropagation()
      cancel_btn = $(e.currentTarget)
      send_btn = @$el.find('#send-js:disabled')
      send_btn.button('reset') if send_btn
      cancel_btn.attr('disabled', 'disabled')

    toggleSendButton: (active) ->
      if active
        @ui.sendButton.removeAttr("disabled") if @ui.sendButton.attr("disabled")
      else
        @ui.sendButton.attr("disabled", "disabled")
