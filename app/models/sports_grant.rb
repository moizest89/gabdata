class SportsGrant
  include Mongoid::Document
  include Sunspot::Mongoid2

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :amount, type: String
  field :created_at, type: Date
  field :name, type: String
  field :slug, type: String
  field :total_men, type: String
  field :total_women, type: String
  field :updated_at, type: Date
  
  searchable do
    string :amount
    string :name
    string :total_men
    string :total_women
  end
  
end
