class ControllersAttestat < ActiveRecord::Base
  self.include_root_in_json = false
  attr_accessible :series, :number, :display_activity, :ekz_date, :ekz_number, :att_date, :att_number, :doc_date, :parent_id, :qualification, :activity
  belongs_to :parent, :class_name => Controllers
  
  def getParentRow
    Controller.find(parent_id)
  end
end
