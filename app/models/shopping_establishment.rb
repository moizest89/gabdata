class ShoppingEstablishment
  include Mongoid::Document

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :address, type: String
  field :city_id, type: String
  field :code, type: String
  field :created_at, type: Date
  field :latitude, type: String
  field :longitude, type: String
  field :name, type: String
  field :phone, type: String
  field :updated_at, type: Date
  
  searchable do
    string :address
    string :code
    string :latitude
    string :longitude
    string :name
    string :phone
  end
  
end
