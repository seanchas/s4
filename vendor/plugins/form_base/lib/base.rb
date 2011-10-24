require 'helper/form_helper'

class Base < ActiveRecord::BaseWithoutTable
  include FormHelper
  
  attr_accessor :name, :method, :action, :enctype
  
  def render
    return FormHelper.form(self)
  end
  
  class << self
    def column(name, helper, sql_type = nil, label = nil, attrs = {}, default = nil, null = true)
      columns << BaseColumn.new(name.to_s, helper, sql_type.to_s, label, attrs, default, null)
      reset_column_information
    end
  end
end
