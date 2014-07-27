class SportsFederationTransfer
  include Mongoid::Document

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :approved_amount, type: String
  field :created_at, type: Date
  field :executed_amount, type: String
  field :extra_amount, type: String
  field :name, type: String
  field :slug, type: String
  field :updated_at, type: Date
  
  searchable do
    string :approved_amount
    string :name
    string :executed_amount
    string :extra_amount
  end
  
end
