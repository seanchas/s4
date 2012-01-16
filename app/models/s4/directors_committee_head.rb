module S4
  
  class DirectorsCommitteeHead < S4::Resource
    
    self.resource_type = :directors_committee_head

    def self.create_xml(row)
      S4::Card.create_common_single_xml('directors_committee_head', row, ["board_fio", "board_firstname", "board_patronymic", "board_position"])
    end
  end
  
end
