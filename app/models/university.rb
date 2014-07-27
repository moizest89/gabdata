class University
  include Mongoid::Document

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :address, type: String
  field :city_id, type: String
  field :code, type: String
  field :created_at, type: Date
  field :kind, type: String
  field :name, type: String
  field :phone, type: String
  field :rector, type: String
  field :reputable, type: String
  field :slug, type: String
  field :updated_at, type: Date
  
  searchable do
    string :name
    string :address
    string :kind
    string :phone
    string :rector
  end

end
