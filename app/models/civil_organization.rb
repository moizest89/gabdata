class CivilOrganization
  include Mongoid::Document
  include Sunspot::Mongoid2

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :address, type: String
  field :civil_organization_type_id, type: Integer
  field :created_at, type: Date
  field :email, type: String
  field :manager, type: String
  field :name, type: String
  field :phone, type: String
  field :slug, type: String
  field :updated_at, type: Date

  searchable do
    string :name
    text :address
  end
end
