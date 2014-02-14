NominaApp.module "Entities", (Entities, NominaApp, Backbone, Marionette, $, _) ->
  class Entities.HeaderCollection extends Backbone.Collection
    model: Entities.Header
