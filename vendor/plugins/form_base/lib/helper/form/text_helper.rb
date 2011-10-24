module FormTextHelper
  def self.formText(text, form = nil)
    html = ""
    if !text.label.nil?
      html << "<label>#{text.label}</label>:&nbsp;"
    end
    
    html << "<input type=\"text\" name=\"#{text.name}\" value=\"#{text.value}\">"
    return html
  end
end