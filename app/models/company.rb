class Company < ActiveRecord::Base
  validates :rfc, :lugar_de_expedicion, :certificado, :llave_privada presence: true 
  #validates :clave, uniqueness: true  
  has_attached_file :certificado,  
  :url => "/system/:attachment/:id/:style/:basename.:extension",  
  :path => ":rails_root/public/system/:attachment/:id/:style/:basename.:extension"  
  validates_attachment_presence :certificado  
  validates_attachment_size :certificado, :less_than => 1.megabytes  
  validates_attachment_content_type :certificado, :content_type => ['application/pkix-cert'], :message => "Formato de archivo No aceptado, permitido (.cer)"
  
  has_attached_file :llave_privada,  
  :url => "/system/:attachment/:id/:style/:basename.:extension",  
  :path => ":rails_root/public/system/:attachment/:id/:style/:basename.:extension"  
  validates_attachment_presence :llave_privada  
  validates_attachment_size :llave_privada, :less_than => 1.megabytes  
  validates_attachment_content_type :llave_privada, :content_type => ['application/octet-stream'], :message => "Formato de archivo No aceptado, permitido (.key)"
  
end
