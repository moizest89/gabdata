class Keyword
  include Mongoid::Document
  field :keyword, type: String
  field :models, type: String

  def get_models_classes
  	self.models.split(",").map{|model| model.singularize.classify.constantize}
  end

  def label_for_select
  	self.keyword.humanize.titleize
  end
end
