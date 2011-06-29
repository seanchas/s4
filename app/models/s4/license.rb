module S4
  
  class License < S4::Resource
    
    self.resource_type = :licence

    def date_begin=(date)
      Rails.logger.debug "DATE: :#{date}:"
      attributes["date_begin"] = date.to_date
    rescue
      attributes["date_begin"] = nil
      Rails.logger.error "INVALID DATE FORMAT: :#{date}:"
    end
    
    def date_end=(date)
      attributes["date_end"] = date.present? ? date.to_date : nil rescue nil
    end
    
  end
  
end
