class InstitutionOrganizationalStructure
  include Mongoid::Document

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :created_at, type: Date
  field :description, type: String
  field :institution_id, type: String
  field :institution_organizational_structure_id, type: String
  field :location, type: String
  field :name, type: String
  field :updated_at, type: Date
end
