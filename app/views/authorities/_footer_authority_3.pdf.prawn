#parent_pdf.text_field("phones", 115, 252, 343, 15)

parent_pdf.text_field("agent_fio1", 50, 87, 370, 15, :default => @vars['agent_fio'])
#parent_pdf.text_field("agent_fio1", 48, 38, 370, 15, :default => @vars['agent_fio'])


parent_pdf.text_field("auth_create_day", 400, 63, 16, 15)
parent_pdf.text_field("auth_create_month", 423, 63, 60, 15)
parent_pdf.text_field("auth_create_year", 499, 63, 16, 15)


parent_pdf.text "\n\n"


#parent_pdf.text "Права и обязанности по сделкам с указанными в настоящей Доверенности Облигациями, заключенным #{"_"*75}", :leading => 4, :align => :justify


#parent_pdf.text "<sup>(Ф.И.О. сотрудника)</sup>", :inline_format => true, :align => :center
#parent_pdf.text "от имени Участника, принадлежат Участнику.\n\n"


parent_pdf.text "Подпись #{"_"*62} удостоверяем.",:leading => 4



parent_pdf.text "<sup>(Ф.И.О. сотрудника, подпись)</sup>", :inline_format => true, :align => :center
parent_pdf.text "Настоящая Доверенность выдана без права передоверия и действительна по «___»__________ 20___г. включительно.",:leading => 4
parent_pdf.text "\n\n"

parent_pdf.text "Контактные тел. Трейдера (____)____________________________________________\n\n",:leading => 4

parent_pdf.text "Руководитель Участника\n",:leading => 4

parent_pdf.text "#{"_"*50}#{" "*17} ___________/ ________________", :leading => 4
parent_pdf.text "<sup>(Должность)</sup>#{" "*70}<sup>(Подпись)</sup>#{" "*15}<sup>Ф.И.О.</sup>", :inline_format => true, :indent_paragraphs => 130

#parent_pdf.text_field("podp", 78, 226, 300, 15, :default => "#{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']}")
#parent_pdf.text "Подпись #{"_"*50}  ___________/ ___________", :leading => 4
#parent_pdf.text "<sup>(занимаемая должность, подпись и Ф.И.О. лица, выдавшего Доверенность)</sup>", :inline_format => true, :indent_paragraphs => 100

parent_pdf.text "\n\nМ.П.#{" "*20}", :align => :right, :indent_paragraphs => -50

parent_pdf.text "\n\nПримечание:\n\n",:leading => 4
parent_pdf.text "<i>Если лицо, подписавшее данную доверенность, действует на основании доверенности, то дополнительно предоставляется:</i>\n\n", :inline_format => true
parent_pdf.text "<i>Нотариально заверенная копия доверенности, подтверждающая полномочия лица на подписание доверенности;</i>\n\n", :inline_format => true, :indent_paragraphs => 20
parent_pdf.text "<i>Документ, подтверждающий полномочия лица, выдавшего доверенность, либо его нотариально заверенная копия,  либо выписка из него, заверенная подписью уполномоченного лица и скрепленная печатью доверителя.</i>\n", :inline_format => true, :indent_paragraphs => 20


parent_pdf.go_to_page 2

parent_pdf.text_field("phone_code", 141, 773, 23, 15)
parent_pdf.text_field("phone", 170, 773, 265, 15)

parent_pdf.text_field("agent_podpis", 0, 723, 300, 15, :default => @vars['ceo_position'])
parent_pdf.text_field("name_podp", 426, 723, 95, 15, :default => @vars['cfs'])