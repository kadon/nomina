NominaApp.module "BuilderApp.Views", (Views, NominaApp, Backbone, Marionette, $, _) ->
  class Views.Layout extends Marionette.Layout
    template: "builder/layout"
    regions:
      panelRegion: "#panel-region"
      contentRegion: "#content-region"
