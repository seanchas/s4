class Organizations::Search::Notice < Base
  column :notice_type,      :string
  column :notice_priority,  :string
  column :status,           :string
  column :start_date,       :string
  column :end_date,         :string
  column :search_text,       :string
end