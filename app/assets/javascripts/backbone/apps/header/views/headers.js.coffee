NominaApp.module "HeaderApp.List.Views", (Views, ManagerDevicesApp, Backbone, Marionette, $, _) ->
  class Views.Headers extends Marionette.CompositeView
    template: "headers/header_template"
    className: "navbar navbar-default navbar-fixed-top"
    itemView: Views.Header
    itemViewContainer: "ul#left-menu-js"
    events:
      "click a.navbar-brand": "brandClicked"
    
    ui:
      userButton: '#user-caret-js'

    brandClicked: (e) ->
      e.preventDefault()
      @trigger "brand:clicked"

    onRender: ->
      this.$el.attr('role', 'navigation')
      @ui.userButton.after(NominaApp.Authorization.current_user.get('email'))
