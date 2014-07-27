require "net/http"
require "uri"
class InstitutionType
  include Mongoid::Document

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  def self.define_mongo_fields( fields = [])
  	fields.each do |field|
  		self.field field.to_sym
		end
  end

  def self.pull_data_from_open_gob_api(page = 1)
      route = self.to_s.underscore.pluralize
      url_string = "http://api.gobiernoabierto.gob.sv/#{route}?page=#{page}"
      url = URI.parse(url_string)
      req = Net::HTTP::Get.new(url.path)
      req['Authorization'] = 'Token token="a1d461bec350c9a3ff62b6f684f10d5e"'
      http = Net::HTTP.new(url.host, url.port)
      res = http.request(req)
      data = JSON.parse res.body
  end
end
