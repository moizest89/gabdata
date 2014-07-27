class MainController < ApplicationController

  def index
  	render :layout => "search"
  end

  def search_result
  		render :layout => "search_result"

  end

end
