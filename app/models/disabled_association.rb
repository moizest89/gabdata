class DisabledAssociation
  include Mongoid::Document
  include Sunspot::Mongoid2

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :acronym, type: String
  field :address, type: String
  field :charge, type: String
  field :contact, type: String
  field :created_at, type: Date
  field :email, type: String
  field :kind, type: String
  field :name, type: String
  field :phone, type: String
  field :slug, type: String
  field :updated_at, type: Date

  searchable do
    string :name
    string :acronym
    string :email
    string :kind
    string :charge
  end

  
end
