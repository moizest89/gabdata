class SchoolInfo
  include Mongoid::Document

  field :_id, type: String
  field :academic_grade_id, type: String
  field :created_at, type: Date
  field :enrollment, type: String
  field :quota, type: String
  field :school_id, type: String
  field :socioeconomic_study, type: String
  field :turn, type: String
  field :updated_at, type: Date
  field :year, type: String
  
  searchable do
    string :enrollment
    string :quota
    string :year
  end

end
