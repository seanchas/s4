render :partial => 'header_authority', 
       :locals => {
         :parent_pdf => parent_pdf,
         :vars => @vars
       }

parent_pdf.text "объявлять заявки и заключать сделки со срочными контрактами, получать и предоставлять документы и осуществлять иные действия, предусмотренные внутренними документами ЗАО «ФБ ММВБ», устанавливающими требования к организации торговли на срочном рынке ЗАО «ФБ ММВБ» и порядку торгов срочными контрактами,", :align => :justify
parent_pdf.text "от имени #{@vars['organization_name']},", :leading => 4
parent_pdf.text "<sup>(наименование организации - Участника торгов)</sup>", :inline_format => true, :indent_paragraphs => 100
parent_pdf.text "приводящие к открытию позиций на следующих позиционных счетах (указать нужное):"
parent_pdf.text "- всех позиционных счетах, либо", :indent_paragraphs => 30
parent_pdf.text "- №№ позиционных счетов.", :indent_paragraphs => 30

render :partial => 'footer_authority', 
       :locals => {
         :parent_pdf => parent_pdf,
         :vars => @vars
       }