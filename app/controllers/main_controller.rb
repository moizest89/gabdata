class MainController < ApplicationController

  def index
  	#@keywords_select = Keyword.all.to_a.map{|k| [k.label_for_select, k.keyword]}
  	#render :layout => "search"

    @results = []
    @error_message = ""
    @response = ""
    @parsed_response = ""
    @url = ""
    @search_value = ""
    
    @keywords_select = Keyword.all.to_a.map{|k| [k.label_for_select, k.keyword]}
    
    
    logger.debug "START"
    if params[:strato]
      @keyword = Keyword.where(keyword: params[:keyword]).first
      @models = @keyword.get_models_classes

      @search_value = params[:strato][:phrase]
      search_data = @search_value.split(" ").join("+")
      @search_mongo = Sunspot.search(@models) do
        fulltext @search_value
      end

      @mongo_results = @search_mongo.results rescue []

      logger.debug "SEARCH: #{@search_value}"

      @url = "http://107.170.49.159:8983/solr/collection1/select?q=#{search_data}&wt=json&indent=true&defType=edismax&stopwords=true&lowercaseOperators=true&row=40"
      url_parsed = URI.parse(@url)
      @response = Net::HTTP.get_response(url_parsed)
      @parsed_response = JSON.parse(@response.body)
      #@total_results = @parsed_response["response"]["numFound"]
      @results = @parsed_response["response"]["docs"]

      puts "Hello, there"
      render "search_result", :layout => "search_result"
    else
      render :layout => "search"
    end
  end

  def search_result
  	@results = []
  	@error_message = ""
  	@response = ""
  	@parsed_response = ""
  	@url = ""
  	@search_value = ""
  	
    @keyword = Keyword.where(keyword: params[:keyword]).first
    @keywords_select = Keyword.all.to_a.map{|k| [k.label_for_select, k.keyword]}
  	@models = @keyword.get_models_classes
  	
  	logger.debug "START"
  	if params[:strato]
  		@search_value = params[:strato][:phrase]
      search_data = @search_value.split(" ").join("+")
  		@search_mongo = Sunspot.search(@models) do
	  		fulltext @search_value
	  	end

	  	@mongo_results = @search_mongo.results rescue []

  		logger.debug "SEARCH: #{@search_value}"

		  @url = "http://107.170.49.159:8983/solr/collection1/select?q=#{search_data}&wt=json&indent=true&defType=edismax&stopwords=true&lowercaseOperators=true&row=40"
		  url_parsed = URI.parse(@url)
		  @response = Net::HTTP.get_response(url_parsed)
		  @parsed_response = JSON.parse(@response.body)
		  #@total_results = @parsed_response["response"]["numFound"]
		  @results = @parsed_response["response"]["docs"]

      puts "Hello, there"
      render "search_result", :layout => "search_result"
    else
      render :layout => "search"
  	end
  end
end
