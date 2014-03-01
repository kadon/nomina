class Employee < ActiveRecord::Base
  validates :rfc, :nombre, :apellido_paterno, :curp, :e_mail, :telefono, :departamento, :clabe, :banco, :numero_de_cuenta, :puesto, :riesgo_del_puesto, :numero_de_seguridad_social, :fecha_inicio_de_relacion_laboral, :periocidad_de_pago, :tipo_de_contrato, :salario_diario_integrado, :salario_base, :tipo_de_regimen, :sexo, :tipo_de_jornada, :antiguedad, :calle, :colonia, :numero_exterior, :numero_interior, :municipio, :estado, :pais, :codigo_postal  presence: true  
  validates :numero_de_empleado, uniqueness: true
end
