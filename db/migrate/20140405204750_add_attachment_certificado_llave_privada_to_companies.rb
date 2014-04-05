class AddAttachmentCertificadoLlavePrivadaToCompanies < ActiveRecord::Migration
  def self.up
    change_table :companies do |t|
      t.attachment :certificado
      t.attachment :llave_privada
    end
  end

  def self.down
    drop_attached_file :companies, :certificado
    drop_attached_file :companies, :llave_privada
  end
end
