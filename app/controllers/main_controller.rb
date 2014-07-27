class MainController < ApplicationController

  def index
  	@results = []
  	@error_message = ""
  	@response = ""
  	@parsed_response = ""
  	@url = ""
  	@search_value = ""

  	logger.debug "START"
  	if params[:strato]
  		@search_value = params[:strato][:phrase]
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

		#render :layout => "search_result"
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

  	logger.debug "START"
  	if params[:strato]
  		@search_value = params[:strato][:phrase]
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
