require 'helper/form_helper'

class Base < ActiveRecord::BaseWithoutTable
  include FormHelper
  
  attr_accessor :name, :method, :action, :enctype
  
  attr_accessor :rowset
  def rowset
    @rowset.nil? ? [] : @rowset
  end
  
  def rowset=(rowset)
    @rowset = rowset
  end

  def render
    return FormHelper.form(self)
  end
  
  class << self
    def column(name, attrs = {}, default = nil, null = true)
      columns << BaseColumn.new(name.to_s, default, attrs, null)
      reset_column_information
    end
  end
end
