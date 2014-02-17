NominaApp.module "BuilderApp.Views", (Views, NominaApp, Backbone, Marionette, $, _) ->
  class Views.Panel extends Marionette.ItemView
    template: "builder/panel"
    className: "panel-body"
    initialize: ->
      console.log "initialize panel..."
