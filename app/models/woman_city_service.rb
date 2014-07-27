class WomanCityService
  include Mongoid::Document
  include Sunspot::Mongoid2

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :area, type: String
  field :created_at, type: Date
  field :name, type: String
  field :phone, type: String
  field :updated_at, type: Date
  field :woman_city_id, type: String
  
  searchable do
    string :name
    string :phone
    string :area
  end

end
