NominaApp.module "Entities", (Entities, NominaApp, Backbone, Marionette, $, _) ->
  API =
    timbrar: (comprobantes_json) ->
      builder_model = new Entities.BuilderModel()
      builder_model.set "comprobantes", JSON.stringify(comprobantes_json)
      defer = $.Deferred()
      builder_model.save
        success: (data) ->
          defer.resolve data
        error: (error) ->
          defer.resolve undefined

      defer

  NominaApp.reqres.setHandler "builder:timbrar",(comprobantes_json) ->
    API.timbrar comprobantes_json

