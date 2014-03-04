NominaApp.module "Entities", (Entities, NominaApp, Backbone, Marionette, $, _) ->
  class Entities.BuilderModel extends Backbone.Model
    urlRoot: "builders"
 
