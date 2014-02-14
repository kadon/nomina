NominaApp.module "Entities", (Entities, NominaApp, Backbone, Marionette, $, _) ->
  initializeHeaders = ->
    Entities.headers = new Entities.HeaderCollection([
      name: "Option1"
      url: "option_1"
    ])

  API = getHeaders: ->
    initializeHeaders()  unless Entities.headers
    Entities.headers

  NominaApp.reqres.setHandler "header:entities", ->
    API.getHeaders()

