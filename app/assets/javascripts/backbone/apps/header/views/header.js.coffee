NominaApp.module "HeaderApp.List.Views", (Views, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  class Views.Header extends Marionette.ItemView
    template: "headers/header_menu"
    tagName: "li"
    events:
      "click a.menu-item": "navigate"

    navigate: (e) ->
      e.preventDefault()
      @trigger "navigate", @model

    onRender: ->
      @$el.addClass "active"  if @model.selected
