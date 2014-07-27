class WomanCity
  include Mongoid::Document
  include Sunspot::Mongoid2

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :address, type: String
  field :contact_email, type: String
  field :contact_person, type: String
  field :contact_phone, type: String
  field :created_at, type: Date
  field :name, type: String
  field :other_services_providers, type: String
  field :schedule, type: String
  field :updated_at, type: Date
  
  searchable do
    string :name
    string :address
    string :contact_email
    string :contact_person
    string :contact_phone
  end
  
end
