class InstitutionInformationStandardsSetting
  include Mongoid::Document

  field :_id, type: String
  field :created_at, type: Date
  field :information_standard_id, type: String
  field :institution_id, type: String
  field :related_institution_id, type: String
  field :updated_at, type: Date
end
