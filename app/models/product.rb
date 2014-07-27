class Product
  include Mongoid::Document
  include Sunspot::Mongoid2

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :code, type: String
  field :created_at, type: Date
  field :name, type: String
  field :product_category_id, type: Integer
  field :slug, type: String
  field :updated_at, type: Date
  
  searchable do
    string :code
    string :product_category_id
    string :name
  end
  
end
