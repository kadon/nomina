NominaApp.module "HeaderApp.List.Views", (Views, NominaApp, Backbone, Marionette, $, _) ->
  class Views.Home extends Marionette.ItemView
    template: "headers/home"
