require "iconv"
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
  
  
  
  def first_string(length, string, type)
    upperTextLength = 0
    spaceTextLength = 0
         
    upperText = string.split("").select{ |elem| (elem>="А")&&(elem<="Я") }.join
    spaceText = string.split("").select{ |elem| elem==" " }.join
    
   
    if upperText.length > 0
      upperTextLength = upperText.length * 6
    end
    
    if spaceText.length > 0
      spaceTextLength = spaceText.length * 2
    end
    
    lowerTextLength = (length - upperTextLength - spaceTextLength)  #определяем количество знакомест; 5.4px - занимает строчная буква; 8.7px занимает прописная буква
      
    textLength = upperText.length + spaceText.length + lowerTextLength / 4
    
    if string.length > textLength
      spliting_string = string.split(" ")
      
      counter = 0
      returnString = ""
      secondString = ""
      
      while textLength > returnString.length
        
          returnString = returnString + spliting_string[ counter ] + " "
          counter+=1
      end
      
      secondString = string[returnString.length..-1] 
    
    else
      returnString = string
    end
    
    if type == 0
      returnData = returnString
    elsif type == 1
      returnData = secondString
    end
    
    return returnData
  end
  
end
