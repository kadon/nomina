NominaApp.module "Entities", (Entities, NominaApp, Backbone, Marionette, $, _) ->
  class Entities.LocalData extends Backbone.Model
    defaults:
      id: null
      name: null
 
