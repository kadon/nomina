NominaApp.module "WebsocketDispatcher", (WebsocketDispatcher, NominaApp, Backbone, Marionette, $, _) ->
  #class Dispatcher
  #  constructor: (url,useWebSockets) ->
  #    @messageQueue = []
  #    @dispatcher = new WebSocketRails(url,useWebSockets)
  #    @dispatcher.on_open = @sendMessage
  #    #@bindEvents()
  

  WebsocketDispatcher.on "start", (options) ->
    #@dispatcher = new Dispatcher(options.websocket_url, true)
    API.dispatcher = new WebSocketRails(options.websocket_url, true)
    API.dispatcher.on_open = API.sendMessage

  API =
    dispatcher: null
    sendMessage: ->
      @trigger 'timbrar', {something: 'message'}
    timbrar_request: (invoice) ->
      @trigger 'timbrar', invoice
    timbrar_response: (message) ->
      WebsocketDispatcher.trigger 'dispatcher:timbrar:response', (message)
