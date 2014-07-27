class SportsFederationTransfer
  include Mongoid::Document
  include Sunspot::Mongoid2

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :approved_amount, type: Float
  field :created_at, type: Date
  field :executed_amount, type: Float
  field :extra_amount, type: Float
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
