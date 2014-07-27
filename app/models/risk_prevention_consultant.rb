class RiskPreventionConsultant
  include Mongoid::Document
  include Sunspot::Mongoid2

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :code, type: String
  field :created_at, type: Date
  field :email, type: String
  field :kind, type: String
  field :name, type: String
  field :phone, type: String
  field :slug, type: String
  field :updated_at, type: Date
  
  searchable do
    string :name
    string :kind
    string :email
    string :code
  end
  
end
