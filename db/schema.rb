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

ActiveRecord::Schema.define(:version => 20120203135324) do

  create_table "capitals", :force => true do |t|
    t.string  "auth_capital_vol"
    t.string  "auth_capital_vollit"
    t.string  "fully_paid"
    t.string  "unpaid_auth_capital_vol"
    t.string  "unpaid_auth_capital_vollit"
    t.string  "no_indirect_owners"
    t.string  "no_ncc_profiters"
    t.string  "user"
    t.integer "s4_id"
  end

  create_table "ceo_attestats", :force => true do |t|
    t.string "series"
    t.string "number"
    t.string "display_activity"
    t.date   "ekz_date"
    t.string "ekz_number"
    t.date   "att_date"
    t.string "att_number"
    t.string "qualification"
    t.string "typeof"
    t.string "parent_id"
    t.text   "activity"
  end

  create_table "ceos", :force => true do |t|
    t.string  "firstname"
    t.string  "surname"
    t.string  "patronymic"
    t.string  "position"
    t.string  "doc_name"
    t.string  "doc_number"
    t.date    "doc_date"
    t.boolean "organs_in_place"
    t.string  "organs_place_other"
    t.string  "user"
    t.integer "s4_id"
  end

  create_table "contacts", :force => true do |t|
    t.string "fio"
    t.string "firstname"
    t.string "patronymic"
    t.string "position"
    t.string "phone_areacode"
    t.string "phone"
    t.string "fax_areacode"
    t.string "fax"
    t.string "email"
    t.string "kind"
    t.string "user"
  end

  create_table "controllers", :force => true do |t|
    t.string  "firstname"
    t.string  "surname"
    t.string  "patronymic"
    t.string  "position"
    t.string  "doc_name"
    t.string  "doc_number"
    t.date    "doc_date"
    t.string  "user"
    t.integer "s4_id"
  end

  create_table "controllers_attestats", :force => true do |t|
    t.string "series"
    t.string "number"
    t.string "display_activity"
    t.date   "ekz_date"
    t.string "ekz_number"
    t.date   "att_date"
    t.string "att_number"
    t.string "parent_id"
    t.text   "qualification"
    t.text   "activity"
  end

  create_table "filial_infos", :force => true do |t|
    t.string  "filial_num"
    t.string  "moscow_addr"
    t.string  "moscow_tel_areacode"
    t.string  "moscow_tel"
    t.string  "moscow_boss"
    t.string  "moscow_boss_firstname"
    t.string  "moscow_boss_patronymic"
    t.string  "moscow_boss_position"
    t.boolean "no_moscow"
    t.string  "user"
    t.integer "s4_id"
  end

  create_table "licenses", :force => true do |t|
    t.string "number"
    t.string "licence_type"
    t.string "licence_organ"
    t.string "date_begin"
    t.string "date_end"
    t.string "kind"
    t.string "user"
  end

  create_table "ncc_federal_laws", :force => true do |t|
    t.string  "corr_acc_corr_countr"
    t.boolean "no_corr_acc_corr_countr"
    t.string  "corr_acc_offshore"
    t.boolean "no_corr_acc_drug"
    t.string  "corr_acc_drug"
    t.boolean "no_corr_acc_offshore"
    t.boolean "no_shell_bank_acc"
    t.string  "at_control_employee_f"
    t.string  "at_control_employee_i"
    t.string  "at_control_employee_o"
    t.boolean "at_control_rules"
    t.boolean "at_control_rules_contr"
    t.boolean "at_identification"
    t.boolean "at_control_of_operation"
    t.string  "at_control_training"
    t.string  "user"
    t.integer "s4_id"
  end

  create_table "okveds", :force => true do |t|
    t.string  "okved"
    t.integer "parent_id"
  end

  create_table "organizations", :force => true do |t|
    t.string  "full_name"
    t.string  "short_name"
    t.string  "full_name_eng"
    t.string  "short_name_eng"
    t.string  "mesto"
    t.string  "post_addr"
    t.string  "fact_addr"
    t.string  "tel_areacode"
    t.string  "tel"
    t.string  "fax_areacode"
    t.string  "fax"
    t.string  "email"
    t.string  "internet"
    t.string  "inn"
    t.string  "kpp"
    t.string  "kpp2"
    t.string  "bik"
    t.string  "swift"
    t.string  "oksm"
    t.string  "registry_number_2002"
    t.date    "reg_date"
    t.string  "registry_organ_2002"
    t.string  "ogrn"
    t.date    "ogrn_date"
    t.string  "registry_organ"
    t.string  "registry_place"
    t.string  "okpo"
    t.string  "okogu"
    t.string  "okfs"
    t.string  "okopf"
    t.string  "okato"
    t.string  "user"
    t.integer "s4_id"
  end

  create_table "phones", :force => true do |t|
    t.string "country"
    t.string "operator"
    t.string "number"
    t.string "main"
    t.string "fio"
    t.string "position"
    t.string "alert_phone_category"
    t.string "kind"
    t.string "user"
  end

  create_table "reg_card_errors", :force => true do |t|
    t.text   "common_errors",   :limit => 2147483647
    t.text   "information",     :limit => 2147483647
    t.text   "licenses",        :limit => 2147483647
    t.text   "ceo",             :limit => 2147483647
    t.text   "controllers",     :limit => 2147483647
    t.text   "structure",       :limit => 2147483647
    t.text   "capital",         :limit => 2147483647
    t.text   "filials",         :limit => 2147483647
    t.text   "ncc_federal_law", :limit => 2147483647
    t.text   "phones",          :limit => 2147483647
    t.text   "sendcard",        :limit => 2147483647
    t.text   "contactlist",     :limit => 2147483647
    t.string "user"
  end

  create_table "reg_card_executors", :force => true do |t|
    t.string  "last_name"
    t.string  "firstname"
    t.string  "patronymic"
    t.string  "tel_areacode"
    t.string  "tel"
    t.string  "extension"
    t.date    "reg_card_date"
    t.string  "user"
    t.integer "s4_id"
  end

  create_table "shell_bank_accs", :force => true do |t|
    t.string "name"
    t.string "parent_id"
  end

  create_table "structures", :force => true do |t|
    t.string  "main_commitee_name"
    t.string  "col_commitee_name"
    t.boolean "no_col_commitee"
    t.string  "board_fio"
    t.string  "board_firstname"
    t.string  "board_patronymic"
    t.string  "board_position"
    t.string  "executive_commitee_name"
    t.string  "user"
    t.integer "s4_id"
    t.boolean "no_executive_commitee"
    t.boolean "no_shareholder"
  end

  create_table "struktures_controls", :force => true do |t|
    t.string  "surname"
    t.string  "firstname"
    t.string  "patronymic"
    t.string  "user"
    t.integer "parent_id"
    t.string  "gridname"
  end

  create_table "struktures_shareholders", :force => true do |t|
    t.string  "name"
    t.string  "share"
    t.integer "parent_id"
    t.string  "user"
  end

  create_table "user_cards_sync_s4s", :force => true do |t|
    t.string  "user"
    t.boolean "card_edited", :default => false
  end

end
