class Syndicate
  include Mongoid::Document
  include Sunspot::Mongoid2

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :acronym, type: String
  field :created_at, type: Date
  field :kind, type: String
  field :name, type: String
  field :slug, type: String
  field :syndicate_category_id, type: String
  field :total_men, type: String
  field :total_women, type: String
  field :updated_at, type: Date
  
  searchable do
    string :name
    string :acronym
    string :kind
  end

end
