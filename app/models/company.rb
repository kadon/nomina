class Company < ActiveRecord::Base
  validates :rfc, :lugar_de_expedicion, presence: true 
  #validates :clave, uniqueness: true  
end
