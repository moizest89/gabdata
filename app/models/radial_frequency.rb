class RadialFrequency
  include Mongoid::Document

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :ab, type: String
  field :acronym, type: String
  field :concession_start_date, type: String
  field :coverage, type: String
  field :created_at, type: Date
  field :freq_rx, type: String
  field :freq_tx, type: String
  field :name, type: String
  field :power, type: String
  field :resolution_number, type: String
  field :updated_at, type: Date
end
