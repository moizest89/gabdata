class RadialConcession
  include Mongoid::Document

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :acronym, type: String
  field :coverage, type: String
  field :created_at, type: Date
  field :freq_tx, type: String
  field :kind, type: String
  field :name, type: String
  field :updated_at, type: Date
end
