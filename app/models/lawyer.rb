class Lawyer
  include Mongoid::Document

  field :_id, type: String
  field :name, type: String
  field :lastname, type: String
end
