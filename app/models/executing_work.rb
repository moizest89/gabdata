class ExecutingWork
  include Mongoid::Document
  include Sunspot::Mongoid2

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :beneficiaries_number, type: Integer
  field :contract_content, type: String
  field :created_at, type: Date
  field :execution_time, type: String
  field :founding_source, type: String
  field :implementing_company, type: String
  field :institution_id, type: String
  field :location, type: String
  field :name, type: String
  field :supervising_company, type: String
  field :total_cost, type: String
  field :updated_at, type: Date
  field :work_responsible, type: String

  searchable do
    string :name
    text :contract_content
    text :implementing_company
    text :founding_source
    text :execution_time

  end
end
