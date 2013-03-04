render :partial => "partial_config", 
       :locals => {
         :parent_pdf => pdf
       }

render :partial => @partial_template, 
       :locals => {
         :parent_pdf => pdf
       }