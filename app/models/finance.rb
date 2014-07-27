class Finance
  include Mongoid::Document
  include Sunspot::Mongoid2

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :address, type: String
  field :auth, type: Boolean
  field :created_at, type: Date
  field :finance_type_id, type: Integer
  field :igd, type: Boolean
  field :name, type: String
  field :phone, type: String
  field :slug, type: String
  field :updated_at, type: Date

  searchable do
    string :name
  end


end
