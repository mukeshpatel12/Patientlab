# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_18_132437) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "patient_labs", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.string "code"
    t.string "name"
    t.string "value"
    t.string "unit"
    t.string "ref_range"
    t.string "finding"
    t.string "result_state"
    t.string "date_of_test"
    t.string "lab_number"
    t.string "clinic_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_patient_labs_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "id_number"
    t.string "patient_name"
    t.string "gender"
    t.integer "date_of_birth"
    t.string "phone_mobile"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "patient_labs", "patients"
end
