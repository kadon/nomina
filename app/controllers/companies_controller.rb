class CompaniesController < ApplicationController
  def index
  end

  def create
  end

  def show
  end

  def destroy
  end

  def update
  end

  def company_params
     params.require(:company).permit(:nombre, :rfc, :lugar_de_expedicion, :registro_patronal, :periocidad_de_pago, :riesgo_del_puesto, :calle, :numero_exterior, :numero_interior, :colonia, :localidad, :municipio, :codigo_postal, :estado, :pais, :regimen, :certificado, :llave_privada)
  end
end
