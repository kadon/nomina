class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :numero_de_empleado
      t.string :nombre
      t.string :apellido_paterno
      t.string :apellido_materno
      t.string :rfc
      t.string :curp
      t.string :e_mail
      t.string :telefono
      t.string :departamento
      t.integer :clabe
      t.integer :banco
      t.string :numero_de_cuenta
      t.string :puesto
      t.string :riesgo_de_puesto
      t.string :numero_seguridad_social
      t.string :fecha_inicio_laboral
      t.string :periocidad_pago
      t.string :tipo_contrato
      t.decimal :salario_diario_integrado
      t.decimal :salario_base_cot_apor
      t.integer :tipo_regimen
      t.string :sexo
      t.string :tipo_jornada
      t.integer :antiguedad
      t.string :calle
      t.string :colonia
      t.string :numero_exterior
      t.string :numero_interior
      t.string :municipio
      t.string :estado
      t.string :pais
      t.integer :codigo_postal

      t.timestamps
    end
  end
end
