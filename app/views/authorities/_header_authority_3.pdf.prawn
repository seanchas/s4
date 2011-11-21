parent_pdf.text "ДОВЕРЕННОСТЬ №______\n\n", :align => :center, :style => :bold
parent_pdf.text_field("auth_num", 303, 776, 35, 19)
parent_pdf.text "г.____________________#{" "*90}«__» __________ 20__г."
parent_pdf.text_field("year", 6, 751, 120, 19)
parent_pdf.text_field("auth_day", 402, 751, 13, 19)
parent_pdf.text_field("auth_month", 424, 751, 60, 19)
parent_pdf.text_field("auth_year", 498, 751, 13, 19)

parent_pdf.text_field("ya", 63, 644, 13, 19)

parent_pdf.text_field("passport_ser", 74, 590, 40, 19)
parent_pdf.text_field("passport_num", 129, 590, 60, 19)
parent_pdf.text_field("passport_date", 230, 590, 290, 19)
parent_pdf.text_field("passport_date2", 0, 567, 523, 19)


parent_pdf.text "\n"
parent_pdf.text "\n"


parent_pdf.text_field("name_supplier4", 173, 711, 350, 15, :default => @vars['organization_name'])
parent_pdf.text "Настоящей Доверенностью #{"_"*58}", :leading => 4, :indent_paragraphs => 30, :align => :justify
parent_pdf.text "#{"_"*87}", :leading => 4


parent_pdf.text "<sup>(наименование организации-Участника)</sup>", :inline_format => true, :align => :center


parent_pdf.text_field("licoco", 35, 666, 523, 15, :default => "#{@vars['ceo_position']}, #{@vars['ceo_fio']}")
parent_pdf.text "в лице #{"_"*80},", :leading => 4



parent_pdf.text "<sup>(занимаемая должность лица, Ф.И.О.)</sup>", :inline_format => true, :align => :center


parent_pdf.text "действующе__ на основании #{@vars['document_name']},"


parent_pdf.text_field("licoco", 110, 629, 383, 15, :default => "#{@vars['agent_position']}")
parent_pdf.text "доверяет сотруднику #{"_"*63}", :leading => 4
parent_pdf.text_field("licoco", 0, 613, 523, 15, :default => "#{@vars['agent_fio']}")
parent_pdf.text "#{"_"*83}", :leading => 4



parent_pdf.text "<sup>(занимаемая должность сотрудника, Ф.И.О.)</sup>", :inline_format => true, :align => :center
parent_pdf.text "паспорт серия ______ № __________, выдан ________________________________________________", :leading => 4
parent_pdf.text "<sup>(когда, кем)</sup>", :inline_format => true, :indent_paragraphs => 370
parent_pdf.text "_____________________________________________________________________________________", :leading => 4



parent_pdf.text "представлять #{@vars['organization_name']} ", :leading => 4



parent_pdf.text "<sup>(наименование организации-Участника)</sup>", :inline_format => true, :align => :center