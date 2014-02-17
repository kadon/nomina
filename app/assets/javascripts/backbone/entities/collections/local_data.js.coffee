NominaApp.module "Entities", (Entities, NominaApp, Backbone, Marionette, $, _) ->
  class Entities.LocalDataCollection extends Backbone.Collection
    model: Entities.LocalData
