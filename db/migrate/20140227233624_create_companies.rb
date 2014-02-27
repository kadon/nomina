class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :nombre
      t.string :rfc
      t.string :lugar_de_expedicion
      t.string :registro_patronal
      t.string :periocidad_de_pago
      t.string :riesgo_del_puesto
      t.string :calle
      t.string :numero_exterior
      t.string :numero_interior
      t.string :colonia
      t.string :localidad
      t.string :municipio
      t.string :codigo_postal
      t.string :estado
      t.string :pais
      t.string :regimen

      t.timestamps
    end
  end
end
