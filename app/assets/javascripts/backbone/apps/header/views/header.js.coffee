NominaApp.module "HeaderApp.List.Views", (Views, NominaApp, Backbone, Marionette, $, _) ->
  class Views.Header extends Marionette.ItemView
    template: "headers/header_menu"
    tagName: "li"
    events:
      "click a": "navigate"

    navigate: (e) ->
      e.preventDefault()
      @trigger "navigate", @model

    onRender: ->
      @$el.addClass "active"  if @model.selected
