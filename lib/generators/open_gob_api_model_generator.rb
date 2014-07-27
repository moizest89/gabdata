require Rails.root.join("lib", "open_gob_api_support.rb")
class OpenGobApiModelGenerator < Rails::Generators::Base
	include OpenGobAPISupport

  def create_initializer_file

  	ROUTES.each do |model|
      data = pull_data(model,1)
      fields_definition = ""
      if data.length > 0
        fields = data.first.keys
        fields.delete_if{|k| k == "id"}
        fields_definition = fields.map{|f| "field :#{f}, type: #{(f=="created_at" or f=="updated_at") ? "Date" : "String" }"}.join("\n  ")
      end
      
    	create_file "app/models/#{model.singularize}.rb", <<-FILE
class #{model.classify}
  include Mongoid::Document

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  #{fields_definition}
end
    FILE
  	end
  end
end