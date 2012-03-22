module S4
  
  class NoticeDetails < S4::Resource
    attr_accessor :user
    self.resource_type = :notice_details;
  end
end
