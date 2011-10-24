module FormSelectHelper
  def self.formSelect(select, form)
    html = ""
    if !select.label.nil?
      html << "<label>#{select.label}</label>:&nbsp;" 
    end
    
    html << "<select name=\"#{select.getName}\">"
    
    select.getOptions.each{|key, value|
      selected = ""
      if key.to_s == (form.send "#{select.getName}")
        selected = " selected"
      end 
      html << "<option value=\"#{key.to_s}\" #{selected}>#{value.to_s}</option>"
    }
    
    html << "</select>"
    return html
  end
end