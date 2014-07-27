class FoodEstablishmentType
  include Mongoid::Document
  include Sunspot::Mongoid2

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :created_at, type: Date
  field :name, type: String
  field :updated_at, type: Date
  
  searchable do
    string :name
  end
  
end
