class Refuge
  include Mongoid::Document

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :address, type: String
  field :city_id, type: String
  field :contact_person, type: String
  field :created_at, type: Date
  field :families_capacity, type: String
  field :has_bathroom, type: String
  field :has_communication, type: String
  field :has_electricity, type: String
  field :has_toilet, type: String
  field :has_water, type: String
  field :kind, type: String
  field :name, type: String
  field :people_capacity, type: String
  field :phone, type: String
  field :slug, type: String
  field :updated_at, type: Date
end
