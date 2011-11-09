parent_pdf.text "ДОВЕРЕННОСТЬ №__", :align => :center, :style => :bold
parent_pdf.text "г.____________________#{" "*90}«__» __________ 20__г."
parent_pdf.text "\n"
parent_pdf.text "\n"
parent_pdf.text "Настоящей Доверенностью #{@vars['organization_name']}", :leading => 4, :indent_paragraphs => 30, :align => :justify
parent_pdf.text "<sup>(наименование организации-Участника)</sup>", :inline_format => true, :align => :center
parent_pdf.text "в лице #{@vars['ceo_position']}, #{@vars['ceo_fio']},", :leading => 4
parent_pdf.text "<sup>(занимаемая должность лица, Ф.И.О.)</sup>", :inline_format => true, :align => :center
parent_pdf.text "действующе__ на основании #{@vars['document_name']},"
parent_pdf.text "доверяет сотруднику #{@vars['agent_position']}, #{@vars['agent_fio']}", :leading => 4
parent_pdf.text "<sup>(занимаемая должность сотрудника, Ф.И.О.)</sup>", :inline_format => true, :align => :center
parent_pdf.text "паспорт серия ______ № __________, выдан ________________________________________________,", :leading => 4
parent_pdf.text "<sup>(когда, кем)</sup>", :inline_format => true, :indent_paragraphs => 370
parent_pdf.text "представлять #{@vars['organization_name']} ", :leading => 4
parent_pdf.text "<sup>(наименование организации-Участника)</sup>", :inline_format => true, :align => :center