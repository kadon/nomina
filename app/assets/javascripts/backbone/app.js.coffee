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

