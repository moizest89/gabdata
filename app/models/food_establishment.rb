class FoodEstablishment
  include Mongoid::Document
  include Sunspot::Mongoid2

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :address, type: String
  field :authorization_expire_at, type: Date
  field :authorized_at, type: Date
  field :city_id, type: Integer
  field :created_at, type: Date
  field :description, type: String
  field :food_establishment_area_id, type: Integer
  field :food_establishment_health_community_id, type: Integer
  field :food_establishment_type_id, type: Integer
  field :name, type: String
  field :slug, type: String
  field :updated_at, type: Date

  searchable do
    string :name
    text :description
  end

end
