NominaApp.module "BuilderApp.Views", (Views, NominaApp, Backbone, Marionette, $, _) ->
  class Views.Content extends Marionette.ItemView
    template: "builder/content"

