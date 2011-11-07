parent_pdf.text "\n"
parent_pdf.text "Доверенность №__\n\n", :align => :center, :style => :bold
parent_pdf.text "г.________________________________________#{" "*50}«__» __________ 20__г.\n\n"
parent_pdf.text "Настоящей доверенностью   #{@vars['organization_name']}", :leading => 4
parent_pdf.text "<sup>(наименование организации - Участника торгов)</sup>", :inline_format => true, :align => :center
parent_pdf.text "в лице  #{@vars['ceo_position']}, #{@vars['ceo_fio']}  ", :leading => 4
parent_pdf.text "<sup>(занимаемая должность лица, Ф.И.О.)</sup>", :inline_format => true, :align => :center
parent_pdf.text "действующего на основании   #{@vars['document_name']}  , уполномочивает"
parent_pdf.text "  #{@vars['agent_position']}, #{@vars['agent_fio']}   (далее - Трейдер)", :leading => 4
parent_pdf.text "<sup>(занимаемая должность лица, Ф.И.О. представителя Участника торгов)</sup>", :inline_format => true, :align => :center
parent_pdf.text "паспорт _____________, выдан ______________________________________________________"
parent_pdf.text "(когда, кем)", :inline_format => true, :indent_paragraphs => 300, :size => 7

