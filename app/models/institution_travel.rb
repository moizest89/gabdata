class InstitutionTravel
  include Mongoid::Document

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :created_at, type: Date
  field :destination, type: String
  field :end_date, type: String
  field :institution_id, type: String
  field :institution_official_job, type: String
  field :institution_official_name, type: String
  field :lodgment_cost, type: String
  field :name, type: String
  field :objetive, type: String
  field :others_cost, type: String
  field :sponsor_contribution, type: String
  field :start_date, type: String
  field :travel_cost, type: String
  field :updated_at, type: Date
  field :viatical_cost, type: String
end
