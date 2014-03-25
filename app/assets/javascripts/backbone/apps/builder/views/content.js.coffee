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

  opts =
    lines: 9 # The number of lines to draw
    length: 5 # The length of each line
    width: 3 # The line thickness
    radius: 5 # The radius of the inner circle
    corners: 1 # Corner roundness (0..1)
    rotate: 0 # The rotation offset
    direction: 1 # 1: clockwise, -1: counterclockwise
    color: "#000" # #rgb or #rrggbb or array of colors
    speed: 1 # Rounds per second
    trail: 30 # Afterglow percentage
    shadow: false # Whether to render a shadow
    hwaccel: false # Whether to use hardware acceleration
    className: "spinner" # The CSS class to assign to the spinner
    zIndex: 2e9 # The z-index (defaults to 2000000000)
    top: "auto" # Top position relative to parent in px
    left: "auto" # Left position relative to parent in px


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

      spinner = new Spinner(opts).spin()
      send_btn.find('div').append(spinner.el)


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
