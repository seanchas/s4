module S4
  
  class FilialInfo < S4::Resource
    
    self.resource_type = :filial_info
    def self.create_xml(row)
      if row.no_moscow == true
        row.moscow_addr = row.moscow_tel_areacode = row.moscow_tel = row.moscow_boss = row.moscow_boss_firstname = nil
        row.moscow_boss_patronymic = row.moscow_boss_position = nil
      end
      S4::Card.create_common_single_xml('filial_info', row, ["user"], true)
    end
  end
  
end
