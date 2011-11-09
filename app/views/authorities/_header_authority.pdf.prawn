parent_pdf.text "ДОВЕРЕННОСТЬ №__\n\n", :align => :center, :style => :bold
parent_pdf.text "г.____________________#{" "*90}«__» __________ 20__г."
parent_pdf.text "\n\n"
parent_pdf.text "Настоящей доверенностью #{@vars['organization_name']}", :leading => 4
parent_pdf.text "<sup>(наименование организации - Участника торгов)</sup>", :inline_format => true, :align => :center
parent_pdf.text "в лице #{@vars['ceo_position']}, #{@vars['ceo_fio']}", :leading => 4
parent_pdf.text "<sup>(занимаемая должность лица, Ф.И.О.)</sup>", :inline_format => true, :align => :center
parent_pdf.text "действующего на основании #{@vars['document_name']}, уполномочивает"
parent_pdf.text "#{@vars['agent_position']}, #{@vars['agent_fio']} (далее - Трейдер)", :leading => 4
parent_pdf.text "<sup>(занимаемая должность лица, Ф.И.О. представителя Участника торгов)</sup>", :inline_format => true, :align => :center
parent_pdf.text "паспорт _____________, выдан _________________________________________________________", :leading => 4
parent_pdf.text "<sup>(когда, кем)</sup>", :inline_format => true, :indent_paragraphs => 300

