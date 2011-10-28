class Documentfilter < ActiveRecord::BaseWithoutTable
  column :by_date_start,    :string
  column :by_date_finish,   :string
  column :by_type,          :string
  column :document_name,    :string
  column :by_sender,        :string
end