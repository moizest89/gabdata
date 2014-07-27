class School
  include Mongoid::Document
  include Sunspot::Mongoid2

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :address, type: String
  field :city_id, type: String
  field :code, type: String
  field :created_at, type: Date
  field :kind, type: String
  field :name, type: String
  field :quotas_number, type: String
  field :slug, type: String
  field :updated_at, type: Date
  
  searchable do
    string :name
    string :number
    string :responsible
  end
  
end
