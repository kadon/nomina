# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140405204750) do

  create_table "builders", force: true do |t|
    t.integer  "status"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: true do |t|
    t.string   "nombre"
    t.string   "rfc"
    t.string   "lugar_de_expedicion"
    t.string   "registro_patronal"
    t.string   "periocidad_de_pago"
    t.string   "riesgo_del_puesto"
    t.string   "calle"
    t.string   "numero_exterior"
    t.string   "numero_interior"
    t.string   "colonia"
    t.string   "localidad"
    t.string   "municipio"
    t.string   "codigo_postal"
    t.string   "estado"
    t.string   "pais"
    t.string   "regimen"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "certificado_file_name"
    t.string   "certificado_content_type"
    t.integer  "certificado_file_size"
    t.datetime "certificado_updated_at"
    t.string   "llave_privada_file_name"
    t.string   "llave_privada_content_type"
    t.integer  "llave_privada_file_size"
    t.datetime "llave_privada_updated_at"
  end

  create_table "employees", force: true do |t|
    t.string   "numero_de_empleado"
    t.string   "nombre"
    t.string   "apellido_paterno"
    t.string   "apellido_materno"
    t.string   "rfc"
    t.string   "curp"
    t.string   "e_mail"
    t.string   "telefono"
    t.string   "departamento"
    t.integer  "clabe"
    t.integer  "banco"
    t.string   "numero_de_cuenta"
    t.string   "puesto"
    t.string   "riesgo_del_puesto"
    t.string   "numero_de_seguridad_social"
    t.string   "fecha_inicio_de_relacion_laboral"
    t.string   "periocidad_de_pago"
    t.string   "tipo_de_contrato"
    t.decimal  "salario_diario_integrado"
    t.decimal  "salario_base"
    t.integer  "tipo_de_regimen"
    t.string   "sexo"
    t.string   "tipo_de_jornada"
    t.integer  "antiguedad"
    t.string   "calle"
    t.string   "colonia"
    t.string   "numero_exterior"
    t.string   "numero_interior"
    t.string   "municipio"
    t.string   "estado"
    t.string   "pais"
    t.integer  "codigo_postal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
