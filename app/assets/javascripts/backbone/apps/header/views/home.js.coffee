NominaApp.module "HeaderApp.List.Views", (Views, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  class Views.Home extends Marionette.ItemView
    template: "headers/home"
