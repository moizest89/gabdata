class Category
  include Mongoid::Document
  include Sunspot::Mongoid2

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :active, type: Boolean
  field :category_id, type: Integer
  field :content, type: String
  field :created_at, type: Date
  field :description, type: String
  field :name, type: String
  field :parameters, type: String
  field :priority, type: Integer
  field :updated_at, type: Date
  searchable do
    string :name
    text :content
    text :description
    text :parameters
  end

end
