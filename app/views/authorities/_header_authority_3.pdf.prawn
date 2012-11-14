parent_pdf.move_down(350)

parent_pdf.text "ДОВЕРЕННОСТЬ №______\n\n", :align => :center, :style => :bold
parent_pdf.text_field("auth_num", 303, 424, 35, 15)
parent_pdf.text "г.____________________#{" "*88}«___» __________ 20___г."
parent_pdf.text_field("year", 6, 399, 120, 15)
parent_pdf.text_field("auth_day", 398, 399, 16, 15)
parent_pdf.text_field("auth_month", 424, 399, 60, 15)
parent_pdf.text_field("auth_year", 498, 399, 16, 15)

parent_pdf.text_field("name_supplier4", 173, 361, 350, 15, :default => first_string(350, "#{@vars['organization_name']}" ,0))
parent_pdf.text_field("name_supplier323", 0, 333, 523, 15, :default => first_string(350, "#{@vars['organization_name']}" ,1))

parent_pdf.text_field("licoco", 35, 316, 488, 15, :default => "#{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']}")

parent_pdf.text_field("ya", 58, 292, 19, 15)
parent_pdf.text_field("gustav", 150, 292, 240, 15, :default => @vars['document_name'])

parent_pdf.text_field("licoco_two", 0, 279, 523, 15, :default => "#{@vars['agent_position']}#{@vars["nbsp_a"]} #{@vars['agent_fio']}")

parent_pdf.text_field("passport_ser", 74, 255, 40, 15)
parent_pdf.text_field("passport_num", 129, 255, 60, 15)
parent_pdf.text_field("passport_date", 230, 255, 293, 15)
parent_pdf.text_field("passport_date2", 0, 231, 523, 15)

#parent_pdf.text_field("bankk", 70, 215, 453, 15, :default => first_string(453, "#{@vars['organization_name']}" ,0))

parent_pdf.text "\n"
parent_pdf.text "\n"


parent_pdf.text "Настоящей Доверенностью #{"_"*58}", :leading => 4, :indent_paragraphs => 30, :align => :justify
parent_pdf.text "<sup>(наименование организации-Участника)</sup>", :inline_format => true, :align => :center
parent_pdf.text "#{"_"*87}", :leading => 4

parent_pdf.text "в лице #{"_"*80},", :leading => 4



parent_pdf.text "<sup>(занимаемая должность лица, Ф.И.О.)</sup>", :inline_format => true, :align => :center

parent_pdf.text "действующ___ на основании #{"_"*40}, уполномочивает"


parent_pdf.text "#{"_"*87}", :leading => 4
parent_pdf.text "<sup>(занимаемая должность сотрудника, Ф.И.О.)</sup>", :inline_format => true, :align => :center




parent_pdf.text "паспорт серия ______ № __________, выдан _________________________________________________", :leading => 4
parent_pdf.text "<sup>(когда, кем)</sup>", :inline_format => true, :indent_paragraphs => 370
parent_pdf.text "#{"_"*87}", :leading => 4



#parent_pdf.text "представлять #{"_"*75}", :leading => 4
#parent_pdf.text "<sup>(наименование организации-Участника)</sup>", :inline_format => true, :align => :center

#parent_pdf.text_field("yazz", 0, 541, 523, 15, :default => first_string(453, "#{@vars['organization_name']}" ,1))
#parent_pdf.text "#{"_"*87}", :leading => 4
#parent_pdf.text "представлять #{@vars['organization_name']}", :leading => 4