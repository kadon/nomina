@NominaApp = new Marionette.Application()

@NominaApp.addRegions
  headerRegion: "#header-region"
  alertsRegion: "#alerts-container"
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
