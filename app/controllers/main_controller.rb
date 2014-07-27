class MainController < ApplicationController

  def index
  	@keywords_select = Keyword.all.to_a.map{|k| [k.label_for_select, k.keyword]}
  	render :layout => "search"
  end

  def search_result
  		render :layout => "search_result"
  end

end
