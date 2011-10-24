class Authority < Base
  def self.getAuthorityTypes
    S4.site = 'http://s4-beta.micex.ru/S4XmlRpcService'
    @sessionId = S4.connection.call("s4.openSession", I18n.locale)
    @typeId = S4.connection.call("s4.getResource", @sessionId, 'warrant_type', "76831d27-6daf-44af-bb73-a72875e9a04f");
    @typeId = S4::Resource.parse_many(@typeId)
    
    @types = {}
    @typeId.each{ |type| @types[type['id']] = type['name'] }
    @types.delete('19')
    @types.delete('20')
    return @types
  end
  
  def self.getOrganisationUsers
    S4.site = 'http://s4-beta.micex.ru/S4XmlRpcService'
    @sessionId = S4.connection.call("s4.openSession", I18n.locale)
    @typeId = S4.connection.call("s4.getResource", @sessionId, 'new_warrant_agent', "76831d27-6daf-44af-bb73-a72875e9a04f");
    @typeId = S4::Resource.parse_many(@typeId)
    
    @types = {}
    @typeId.each{ |type| @types[type['id']] = type['full_name'] }
    return @types
  end
  
  column :typeId,          :select, :string, "Тип доверенности",        self.getAuthorityTypes
  column :userId,          :select, :string, "Пользователь организации", self.getOrganisationUsers
  column :user,            :text,   :string, "Новый пользователь"
  column :createAuthority, :button, nil,      nil,                     {"name" => "Создать доверенность"}
end