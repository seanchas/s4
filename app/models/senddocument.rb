class Senddocument < Base
  include S4

  def self.getDocumentTypes
    #S4.site = 'http://s4-beta.micex.ru/S4XmlRpcService'
    @sessionId = S4.connection.call("s4.openSession", I18n.locale)
    @typeId = S4.connection.call("s4.getResource", @sessionId, 'sended_form_type', "76831d27-6daf-44af-bb73-a72875e9a04f", {
      'sended_form_kind' => '5'
    }, 'test-parameter');
    @typeId = S4::Resource.parse_many(@typeId)
    
    @types = {}
    @typeId.each{ |type| @types[type['id']] = type['name'] }
    return @types
  end
  
  column :typeId,       :select, :string, "Тип документа", self.getDocumentTypes
  column :document,     :file,   :string, "Документ"
  column :sendDocument, :button, nil,      nil,           {'name' => 'Отправить документ'}
  
  validates_presence_of :typeId, :document
end