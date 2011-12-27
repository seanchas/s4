require 'helper/form/select_helper'
require 'helper/form/text_helper'
require 'helper/form/file_helper'
require 'helper/form/button_helper'

class BaseColumn < ActiveRecord::ConnectionAdapters::Column
  include FormSelectHelper
  include FormTextHelper
  include FormFileHelper
  include FormButtonHelper
  
  attr_accessor :helper, :attrs, :options, :label, :value
  
  @options = {}
  
  def initialize(name, default = nil, attrs = {}, null = true)
    @attrs = attrs
    @options = attrs
    super(name, default, nil, null)
  end
  
  def render(form)
    helperClassName = "Form#{@helper.capitalize}Helper"
    return helperClassName.constantize.send "form#{@helper.capitalize}", self, form
  end
  
  def addOption(key, value)
    @options[key] = value
  end
  
  def setOptions(options)
    @options = options
  end
  
  def getOptions
    @options
  end
  
  def getAttrs
    @attrs
  end
  
  def getName
    @name
  end
end