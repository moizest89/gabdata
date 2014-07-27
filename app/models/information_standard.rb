class InformationStandard
  include Mongoid::Document

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :acronym, type: String
  field :created_at, type: Date
  field :information_standard_frame_id, type: String
  field :name, type: String
  field :priority, type: String
  field :slug, type: String
  field :updated_at, type: Date
end
