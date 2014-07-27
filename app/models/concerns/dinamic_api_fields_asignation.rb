module DinamicApiFieldsDefinination
  extend ActiveSupport::Concern
  
  included do
    table_name = self.to_s.underscore.pluralize
    children_references = Relationship.where(parent: table_name)
    parent_references = Relationship.where(children: table_name )
    children_references.each do |reference|
      embeds_many reference.children.to_sym
    end
    parent_references.each do |reference|
      embedded_in reference.parent.to_sym
    end
  end
  module ClassMethods
    
    def pull_data_from_open_gob_api(page = 1)
      route = self.to_s.underscore.pluralize
      url_string = "http://api.gobiernoabierto.gob.sv/\#{route}?page=\#{page}"
      url = URI.parse(url_string)
      req = Net::HTTP::Get.new(url.path)
      req['Authorization'] = 'Token token="a1d461bec350c9a3ff62b6f684f10d5e"'
      http = Net::HTTP.new(url.host, url.port)
      res = http.request(req)
      data = JSON.parse res.body
    end

    def define_mongo_fields( fields = [])
      fields.each do |field|
        self.field field.to_sym
      end
    end
  end
end