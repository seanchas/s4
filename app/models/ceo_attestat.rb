class CeoAttestat < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :series, :number, :display_activity, :ekz_date, :ekz_number, :att_date, :att_number, :qualification, :activity, :parent_id
  belongs_to :parent, :class_name => Ceo
end