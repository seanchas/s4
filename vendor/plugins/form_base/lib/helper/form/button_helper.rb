module FormButtonHelper
  def self.formButton(button, form = nil)
    attrs = button.getAttrs
    html = "<br><input type=\"submit\" value=\"#{attrs['name']}\">"
    return html
  end
end