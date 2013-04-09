
parent_pdf.text "\n\n"
parent_pdf.text "Права и обязанности по указанным в настоящей Доверенности сделкам, заключенным", :leading => 4

parent_pdf.text "#{"_"*87}", :leading => 4
parent_pdf.text "<sup>(Ф.И.О. сотрудника)</sup>", :inline_format => true, :indent_paragraphs => 200
parent_pdf.text "от имени Участника, принадлежат Участнику.", :leading => 10


parent_pdf.text "Подпись #{"_"*67} удостоверяю.", :leading => 4


parent_pdf.text "<sup>(Ф.И.О. сотрудника, подпись)</sup>", :inline_format => true, :align => :center
parent_pdf.text "Настоящая Доверенность действительна до «___»__________ 20___г."
parent_pdf.text "\n\n"
parent_pdf.text "Контактные тел. ________________________________________________\n\n"


#parent_pdf.text "Подпись #{@vars['ceo_position']}#{@vars["nbsp_c"]} #{@vars['ceo_fio']} ___________/ ___________", :leading => 4, :indent_paragraphs => 30
parent_pdf.text "Подпись #{"_"*78}_", :leading => 4
parent_pdf.text "<sup>(занимаемая должность, подпись и Ф.И.О. лица, выдавшего Доверенность)</sup>", :inline_format => true, :indent_paragraphs => 100, :leading => 20

#parent_pdf.text "#{"_"*50}#{" "*17} ___________/ ________________", :leading => 4
#parent_pdf.text "<sup>(Должность)</sup>#{" "*70}<sup>(Подпись)</sup>#{" "*15}<sup>Ф.И.О.</sup>", :inline_format => true, :indent_paragraphs => 130

parent_pdf.text "\n\nМ.П.#{" "*20}", :align => :left, :indent_paragraphs => 50


parent_pdf.go_to_page 2

parent_pdf.text_field("position_agent21512", 0, 774-17, 523, 15, :default => "#{@vars['agent_fio']}")

parent_pdf.text_field("agent_fio1", 48, 728-17, 400, 15, :default => @vars['agent_fio'])


parent_pdf.text_field("auth_create_day", 232, 704-17, 17, 15)
parent_pdf.text_field("auth_create_month", 255, 704-17, 60, 15)
parent_pdf.text_field("auth_create_year", 330, 704-17, 17, 15)

parent_pdf.text_field("phone_code", 87, 683-17-17, 30, 15)
parent_pdf.text_field("phone", 120, 683-17-17, 265, 15)

parent_pdf.text_field("agent_podpis", 50, 657-17-17, 300, 15, :default => @vars['ceo_position'])
parent_pdf.text_field("name_podp", 390, 657-17-17, 95, 15, :default => @vars['cfs'])


