class HealthEstablishment
  include Mongoid::Document

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :address, type: String
  field :city_id, type: String
  field :created_at, type: Date
  field :health_establishment_type_id, type: String
  field :inscription, type: String
  field :name, type: String
  field :phone, type: String
  field :slug, type: String
  field :updated_at, type: Date
  
  searchable do
    string :name
    string :address
  end
end
