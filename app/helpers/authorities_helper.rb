require 'rchardet'

module AuthoritiesHelper
  
  def render_to_pdf(options = nil)
    data = render_to_string(options)
    Rails.logger.info("data = #{data}")
    cd = CharDet.detect(data)
    pdf = PDF::HTMLDoc.new("pdf14")
    pdf.set_option :footer, '.'
    pdf.set_option :embedfonts, true
    pdf.set_option :webpage, true
    pdf.set_option :charset, 'cp-1251'
    #pdf.set_option :top, '0cm'
    pdf.set_option :bottom, '0cm'
    pdf.set_option :left, '1.5cm'
    pdf.set_option :right, '1.5cm'
    pdf << Iconv::iconv('cp1251', cd['encoding'], data).join
    
    pdf.generate
  end
  
end
