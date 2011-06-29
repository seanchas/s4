module S4
  
  class License < S4::Resource
    
    self.resource_type = :licence

    def date_begin=(date)
      Rails.logger.info "License date :#{date}:"
      attributes["date_begin"] = date.to_date
    end
    
    def date_end=(date)
      attributes["date_end"] = date.present? ? date.to_date : nil
    end
    
  end
  
end
