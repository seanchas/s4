module FormHelper
  def self.form(form)
    html = "<form name=\"#{form.name}\" action=\"#{form.action}\" method=\"#{form.method}\" enctype=\"multipart/form-data\">"
    
    (form.class).columns.each{|col|
      html += "<div>#{col.render(form)}</div>"
    }
    
    html += "</form>"
    return html
  end
end