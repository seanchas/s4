# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111227071552) do

  create_table "admins", :force => true do |t|
    t.string "lastname"
    t.string "firstname"
    t.string "middlename"
    t.string "position"
    t.string "documentName"
    t.date   "documentDate"
    t.string "documentNumber"
    t.string "place"
    t.string "user"
  end

  create_table "admins_attestats", :force => true do |t|
    t.string  "serial"
    t.string  "number"
    t.date    "date_order"
    t.string  "number_order"
    t.date    "date_certification"
    t.string  "qualification"
    t.integer "parent_id"
    t.string  "number_certification"
    t.string  "typeof"
  end

  create_table "capitals", :force => true do |t|
    t.string "ciframi"
    t.string "podpis"
    t.string "ciframi_chast"
    t.string "podpis_chast"
    t.string "user"
    t.string "oplachen_polnost"
  end

  create_table "clirings", :force => true do |t|
    t.string "legal_countries"
    t.string "hidden_finance_countries"
    t.string "drugs_countries"
    t.string "firstname"
    t.string "lastname"
    t.string "otchestvo"
    t.string "plavila_kontrolya"
    t.string "otvestv_za_pravila_kontrolya"
    t.string "id_client"
    t.string "obyaz_kontrol"
    t.string "obychenie_kadrov"
    t.string "user"
  end

  create_table "contacts", :force => true do |t|
    t.string "firstname"
    t.string "secondname"
    t.string "otchestvo"
    t.string "dolzhnost"
    t.string "code_phone"
    t.string "phone"
    t.string "code_fax"
    t.string "fax"
    t.string "email"
    t.string "deportament"
    t.string "user"
  end

  create_table "controllers", :force => true do |t|
    t.string "lastname"
    t.string "firstname"
    t.string "middlename"
    t.string "position"
    t.string "documentName"
    t.date   "documentDate"
    t.string "documentNumber"
    t.string "user"
  end

  create_table "controllers_attestats", :force => true do |t|
    t.string  "serial"
    t.string  "number"
    t.date    "date_order"
    t.string  "number_order"
    t.date    "date_certification"
    t.string  "qualification"
    t.integer "parent_id"
    t.string  "number_certification"
    t.string  "typeof"
  end

  create_table "filials", :force => true do |t|
    t.string "adres"
    t.string "code_town"
    t.string "phone"
    t.string "firstname"
    t.string "lastname"
    t.string "otchestvo"
    t.string "dolzhnost"
    t.string "moscow"
    t.string "kolvo"
    t.string "user"
  end

  create_table "lica_capitals", :force => true do |t|
    t.string  "familia"
    t.string  "name"
    t.string  "otchestvo"
    t.string  "dolya"
    t.integer "parent_id"
  end

  create_table "licenses", :force => true do |t|
    t.string "number"
    t.string "typeof"
    t.string "subject"
    t.string "date_create"
    t.string "date_expired"
    t.string "deportament"
    t.string "user"
  end

  create_table "phones", :force => true do |t|
    t.string "code_country"
    t.string "code_operator"
    t.string "phone_num"
    t.string "osnovnoy"
    t.string "fiovladelca"
    t.string "dolzhnost"
    t.string "catnum"
    t.string "deportament"
    t.string "user"
  end

  create_table "scheta_clirings", :force => true do |t|
    t.text    "name"
    t.integer "parent_id"
  end

  create_table "struktures", :force => true do |t|
    t.string "namus_vou"
    t.string "namus_kou"
    t.string "ystav_view"
    t.string "firstname"
    t.string "lastname"
    t.string "otchestvo"
    t.string "dolzhnost"
    t.string "namus_kiou"
    t.string "user"
  end

  create_table "struktures_controls", :force => true do |t|
    t.string  "firstname"
    t.string  "lastname"
    t.string  "middlename"
    t.string  "user"
    t.integer "parent_id"
    t.string  "gridname"
  end

  create_table "struktures_fivepercents", :force => true do |t|
    t.string  "name"
    t.string  "dola"
    t.integer "parent_id"
    t.string  "user"
  end

  create_table "vigodnopreobretatels", :force => true do |t|
    t.string  "name"
    t.string  "number"
    t.string  "date"
    t.integer "parent_id"
  end

end
