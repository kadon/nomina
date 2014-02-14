NominaApp.module "Authorization", (Authorization, NominaApp, Backbone, Marionette, $, _) ->
  Authorization.on "start", (options) ->
    @current_user = new Backbone.Model(options.current_user_object) #Set current user
