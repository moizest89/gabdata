class InstitutionRemuneration
  include Mongoid::Document

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :created_at, type: Date
  field :honorary, type: String
  field :individual_monthly_remuneration, type: String
  field :institution_id, type: String
  field :line_of_work_id, type: String
  field :name, type: String
  field :other_remuneration, type: String
  field :total_employee, type: String
  field :updated_at, type: Date
  field :wage_category, type: String
end
