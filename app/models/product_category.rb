class ProductCategory
  include Mongoid::Document

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :category_id, type: String
  field :code, type: String
  field :created_at, type: Date
  field :name, type: String
  field :updated_at, type: Date
  
  searchable do
    string :name
  end
  
end
