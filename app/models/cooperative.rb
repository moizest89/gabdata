class Cooperative
  include Mongoid::Document
  include Sunspot::Mongoid2

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :acronym, type: String
  field :address, type: String
  field :city_id, type: Integer
  field :cooperative_type_id, type: String
  field :created_at, type: Date
  field :email, type: String
  field :name, type: String
  field :phone1, type: String
  field :phone2, type: String
  field :slug, type: String
  field :total_men, type: Integer
  field :total_women, type: Integer
  field :updated_at, type: Date

  searchable do
    string :name
    string :email
  end
end
