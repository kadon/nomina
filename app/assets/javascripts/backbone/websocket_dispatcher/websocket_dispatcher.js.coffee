NominaApp.module "WebsocketDispatcher", (WebsocketDispatcher, NominaApp, Backbone, Marionette, $, _) ->

  WebsocketDispatcher.on "start", (options) ->
    API.dispatcher = new WebSocketRails(options.websocket_url, true)
    API.dispatcher.on_open = API.sendMessage
    API.bindEvents()

  WebsocketDispatcher.on "timbrar:request", (invoice) ->
    API.timbrar_request (invoice)

  WebsocketDispatcher.on "timbrar:success", (invoice) ->
    console.log(invoice)

  WebsocketDispatcher.on "timbrar:fail", (invoice) ->
    console.log(invoice)

  API =
    dispatcher: null

    sendMessage: ->
      @trigger 'timbrar', {something: 'message'}

    timbrar_request: (invoice) ->
      @dispatcher.trigger 'timbrar', invoice

    bindEvents: ->
      @dispatcher.bind "timbrar_success", @timbrar_success
      @dispatcher.bind "timbrar_fail", @timbrar_fail

    timbrar_success: (invoice) ->
      WebsocketDispatcher.trigger 'timbrar:success', (invoice)

    timbrar_fail: (invoice) ->
      WebsocketDispatcher.trigger 'timbrar:fails', (invoice)
