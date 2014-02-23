NominaApp.module "Common.Views", (Views, NominaApp, Backbone, Marionette, $, _) ->

  class Views.Alert extends Marionette.ItemView
    template: "common/alert_template"
    className: "alert"

    events:
      "click a.close": @remove

    onRender: ->
      type = @model.get("type")
      @$el.addClass("alert-" + type ) if type


