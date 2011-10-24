module FormFileHelper
  def self.formFile(file, form = nil)
    html = ""
    if !file.label.nil?
      html << "<label>#{file.label}</label>:&nbsp;" 
    end
    html << "<input type=\"file\" name=\"#{file.getName}\">"
    return html
  end
end