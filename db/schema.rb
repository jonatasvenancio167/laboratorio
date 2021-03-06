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

ActiveRecord::Schema.define(version: 2021_07_21_222449) do

  create_table "exams", force: :cascade do |t|
    t.string "nome"
    t.string "tipo"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "laboratories", force: :cascade do |t|
    t.string "nome"
    t.string "endereco"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "laboratory_exams", force: :cascade do |t|
    t.integer "laboratory_id", null: false
    t.integer "exam_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exam_id"], name: "index_laboratory_exams_on_exam_id"
    t.index ["laboratory_id"], name: "index_laboratory_exams_on_laboratory_id"
  end

  add_foreign_key "laboratory_exams", "exams"
  add_foreign_key "laboratory_exams", "laboratories"
end
