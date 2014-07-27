class MainController < ApplicationController

  def index
  	@keywords_select = Keyword.all.to_a.map{|k| [k.label_for_select, k.keyword]}
  	render :layout => "search"
  end

  def search_result
  	#render :layout => "search_result"
    
  	@keywords_select = Keyword.all.to_a.map{|k| [k.label_for_select, k.keyword]}
    @results = []
  	@error_message = ""
  	@response = ""
  	@parsed_response = ""
  	@url = ""
  	@search_value = ""
  	if params[:strato]
  		@search_value = params[:strato][:phrase]
      search_param = @search_value.to_s.split(" ").join("+")
	  	begin
			  @url = "http://107.170.49.159:8983/solr/collection1/select?q=#{search_param}&wt=json&indent=true&defType=edismax&stopwords=true&lowercaseOperators=true"
			  url_parsed = URI.parse(@url)
			  @response = Net::HTTP.get_response(url_parsed)
			  @parsed_response = JSON.parse(@response.body)
			  #@total_results = @parsed_response["response"]["numFound"]
			  @results = @parsed_response["response"]["docs"]
			rescue => error
				@error_message = "Your search didn't get any result"
			end
      
			render "search_result", :layout => "search_result"
		else
			render :layout => "search"
	  end
  end

  def search_result
  	render :layout => "search_result"

  	@results = []
  	@error_message = ""
  	@response = ""
  	@parsed_response = ""
  	@url = ""
  	@search_value = ""
  	@keyword = Keyword.where(keyword: params[:keyword]).first
  	@models = @keyword.get_models_classes
  	
  	logger.debug "START"
  	if params[:strato]
  		@search_value = params[:strato][:phrase]
  		@search_mongo = Sunspot.search(@models) do
	  		fulltext @search_value
	  	end
	  	@mongo_results = @search_mongo.results
  		logger.debug "SEARCH: #{@search_value}"
  		begin
			  @url = "http://107.170.49.159:8983/solr/collection1/select?q=#{@search_value}&wt=json&indent=true&defType=edismax&stopwords=true&lowercaseOperators=true"
			  url_parsed = URI.parse(@url)
			  @response = Net::HTTP.get_response(url_parsed)
			  @parsed_response = JSON.parse(@response.body)
			  #@total_results = @parsed_response["response"]["numFound"]
			  @results = @parsed_response["response"]["docs"]
			rescue => error
				@error_message = "Your search didn't get any result"
			end
  	end
  end
end
