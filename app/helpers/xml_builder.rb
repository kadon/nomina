module XMLBuilder
=begin
 En este módulo meteré todas las clases para armar el xml, la 
 clase Layout será la principal responsable de generar el xml para timbrarlo 
=end  

  # Definimos todas las constantes para armar el xml
  VERSION = 1.0
  
  
  class Layout
    def initialize            
      @emisor = Emisor.new
      @receptor= Receptor.new
      @conceptos = []        
    end
  end
  
  # Clase para obtener los datos del Emisor 
  class Emisor
    # Constructor inicializando un Hash con los elementos que debe contener.
    def initialize      
      @datos_emisor = {}  
      @datos_emisor_domicilio_fiscal = {}
      @datos_emisor_expedido_en = {}
      
      @datos_emisor['nombre'] = nil
      @datos_emisor['rfc'] = nil     
      @datos_emisor['Regimen'] = nil   
            
      @datos_emisor_domicilio_fiscal['codigoPostal'] = nil
      @datos_emisor_domicilio_fiscal['pais'] = nil
      @datos_emisor_domicilio_fiscal['estado'] = nil
      @datos_emisor_domicilio_fiscal['municipio'] = nil
      @datos_emisor_domicilio_fiscal['colonia'] = nil
      @datos_emisor_domicilio_fiscal['noInterior'] = nil
      @datos_emisor_domicilio_fiscal['noExterior'] = nil
      @datos_emisor_domicilio_fiscal['calle'] = nil
           
      @datos_emisor_expedido_en['codigoPostal'] = nil
      @datos_emisor_expedido_en['pais'] = nil
      @datos_emisor_expedido_en['estado'] = nil
      @datos_emisor_expedido_en['municipio'] = nil
      @datos_emisor_expedido_en['colonia'] = nil
      @datos_emisor_expedido_en['noInterior'] = nil
      @datos_emisor_expedido_en['noExterior'] = nil
      @datos_emisor_expedido_en['calle'] = nil
    end
    
    # Método que recupera los registros del modelo Company y los asigna en el Hash
    def asigna_valores
      @company = Company.all
      
      @company.each do |compay|                  
        @datos_emisor['nombre'] = company.nombre
        @datos_emisor['rfc'] = company.rfc      
        @datos_emisor['regimen'] = company.regimen   
        
        @datos_emisor_domicilio_fiscal['codigoPostal'] = company.codigo_postal
        @datos_emisor_domicilio_fiscal['pais'] = company.pais
        @datos_emisor_domicilio_fiscal['estado'] = company.estado
        @datos_emisor_domicilio_fiscal['municipio'] = company.municipio
        @datos_emisor_domicilio_fiscal['colonia'] = company.colonia
        @datos_emisor_domicilio_fiscal['noInterior'] = company.numero_interior
        @datos_emisor_domicilio_fiscal['noExterior'] = company.numero_exterior
        @datos_emisor_domicilio_fiscal['calle'] = company.calle   
          
        @datos_emisor_expedido_en['codigoPostal'] = company.codigo_postal
        @datos_emisor_expedido_en['pais'] = company.pais
        @datos_emisor_expedido_en['estado'] = company.estado
        @datos_emisor_expedido_en['municipio'] = company.municipio
        @datos_emisor_expedido_en['colonia'] = company.colonia
        @datos_emisor_expedido_en['noInterior'] = company.numero_interior
        @datos_emisor_expedido_en['noExterior'] = company.numero_exterior
        @datos_emisor_expedido_en['calle'] = company.calle  
      end        
    end
  end
  
  # Clase para obtener los datos del Receptor 
  class Receptor
    # Constructor inicializando un Hash con los elementos que debe contener.
    def initialize      
      @datos_receptor = {}  
      
      @datos_receptor['nombre'] = nil
      @datos_receptor['rfc'] = nil          
            
      @datos_receptor['codigoPostal'] = nil
      @datos_receptor['pais'] = nil
      @datos_receptor['estado'] = nil
      @datos_receptor['municipio'] = nil
      @datos_receptor['colonia'] = nil
      @datos_receptor['noInterior'] = nil
      @datos_receptor['noExterior'] = nil
      @datos_receptor['calle'] = nil       
    end
    
    # Método que recupera los registros del modelo Company y los asigna en el Hash
    def asigna_valores rfc_empleado
      # Consulto al empleado según su RFC y obtengo sus datos
      employee = Employee.where("rfc = ?, rfc_empleado")
      #if employee.count > o
      if employee
        @datos_emisor['nombre'] = employee.nombre
        @datos_emisor['rfc'] = employee.rfc      
       
        @datos_emisor['codigoPostal'] = employee.codigo_postal
        @datos_emisor['pais'] = employee.pais
        @datos_emisor['estado'] = employee.estado
        @datos_emisor['municipio'] = employee.municipio
        @datos_emisor['colonia'] = employee.colonia
        @datos_emisor['noInterior'] = employee.numero_interior
        @datos_emisor['noExterior'] = employee.numero_exterior
        @datos_emisor['calle'] = employee.calle                    
      end
    end
  end
end