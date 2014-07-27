class InformationStandardInfo
  include Mongoid::Document

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :information_standard_category_id, type: String
  field :information_standard_id, type: String
  field :percent, type: String
end
