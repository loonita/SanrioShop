# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_21_004312) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "adminpack"
  enable_extension "plpgsql"

  create_table "arrendatario", primary_key: "ruta", id: { type: :string, limit: 12 }, force: :cascade do |t|
    t.string "nombre", limit: 20
    t.string "telefono", limit: 20
    t.string "direccion", limit: 20
  end

  create_table "asiste", primary_key: ["dep_id", "soc_cod", "asi_fecha"], force: :cascade do |t|
    t.integer "dep_id", null: false
    t.integer "soc_cod", null: false
    t.date "asi_fecha", null: false
  end

  create_table "deporte", primary_key: "dep_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "dep_nombre", limit: 20
    t.string "dep_nivel", limit: 10
  end

  create_table "dueño", primary_key: "rutd", id: { type: :string, limit: 12 }, force: :cascade do |t|
    t.string "nombre", limit: 20
    t.string "telefono", limit: 10
    t.string "direccion", limit: 20
  end

  create_table "producto", primary_key: "pro_cod", id: :integer, default: nil, force: :cascade do |t|
    t.string "pro_nombre", limit: 20
    t.string "pro_tipo", limit: 10
    t.string "pro_unidadmedida", limit: 10
  end

  create_table "products", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.integer "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "receta", primary_key: "rec_cod", id: :integer, default: nil, force: :cascade do |t|
    t.string "rec_nombre", limit: 20
    t.string "rec_tipo", limit: 10
  end

  create_table "requiere", primary_key: ["pro_cod", "rec_cod"], force: :cascade do |t|
    t.integer "pro_cod", null: false
    t.integer "rec_cod", null: false
    t.integer "req_cantidad"
  end

  create_table "socio", primary_key: "soc_cod", id: :integer, default: nil, force: :cascade do |t|
    t.string "soc_nombre", limit: 20
    t.string "soc_tipo", limit: 20
  end

  add_foreign_key "asiste", "deporte", column: "dep_id", primary_key: "dep_id", name: "asiste_dep_id_fkey"
  add_foreign_key "asiste", "socio", column: "soc_cod", primary_key: "soc_cod", name: "asiste_soc_cod_fkey"
  add_foreign_key "requiere", "producto", column: "pro_cod", primary_key: "pro_cod", name: "requiere_pro_cod_fkey"
  add_foreign_key "requiere", "receta", column: "rec_cod", primary_key: "rec_cod", name: "requiere_rec_cod_fkey"
end
