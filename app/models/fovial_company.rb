class FovialCompany
  include Mongoid::Document

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :created_at, type: Date
  field :email, type: String
  field :name, type: String
  field :phone, type: String
  field :slug, type: String
  field :updated_at, type: Date
end
