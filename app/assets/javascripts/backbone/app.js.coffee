@NominaApp = new Marionette.Application()

@NominaApp.addRegions
  headerRegion: "#header-region"
  alertsRegion: "#alerts-region"
  mainRegion: "#main-region"
  dialogRegion: "#dialog-region"#Marionette.Region.Dialog.extend(el: "#dialog-region")
  footerRegion: "#footer-region"

@NominaApp.navigate = (route, options) ->
  options or (options = {})
  Backbone.history.navigate route, options

@NominaApp.getCurrentRoute = ->
  Backbone.history.fragment

@NominaApp.on "initialize:after", ->
  if Backbone.history
    Backbone.history.start()
    NominaApp.trigger "home:index" if @getCurrentRoute() is ""

@NominaApp.on "show:alert", (message, type) ->
  model = new Backbone.Model({ type: type, message: message })
  NominaApp.alertsRegion.show new NominaApp.Common.Views.Alert({model: model})
