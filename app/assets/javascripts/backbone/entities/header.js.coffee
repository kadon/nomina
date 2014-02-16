NominaApp.module "Entities", (Entities, NominaApp, Backbone, Marionette, $, _) ->
  initializeHeaders = ->
    Entities.headers = new Entities.HeaderCollection([
      name: "Builder"
      url: "builder"
    ])

  API = getHeaders: ->
    initializeHeaders()  unless Entities.headers
    Entities.headers

  NominaApp.reqres.setHandler "header:entities", ->
    API.getHeaders()

