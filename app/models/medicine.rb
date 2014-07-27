class Medicine
  include Mongoid::Document
  include Sunspot::Mongoid2

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :created_at, type: Date
  field :medicine_category_id, type: String
  field :name, type: String
  field :price, type: String
  field :quantity, type: String
  field :slug, type: String
  field :unit, type: String
  field :updated_at, type: Date
  
  searchable do
    string :name
    string :price
  end
  
end
