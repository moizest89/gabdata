class SportsGrant
  include Mongoid::Document

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :amount, type: String
  field :created_at, type: Date
  field :name, type: String
  field :slug, type: String
  field :total_men, type: String
  field :total_women, type: String
  field :updated_at, type: Date
end
