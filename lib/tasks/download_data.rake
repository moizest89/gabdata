require "net/http"
require "uri"

ROUTES = ["academic_grades","accountants","budget_units","carreers","categories","cities","civil_organization_types","civil_organizations","companies","company_penalties","cooperative_types","cooperatives","cultural_fee_place_contacts","cultural_fee_places","cultural_fee_price_types","cultural_fee_types","cultural_fees","delation_infos","delation_institutions","delegation_infos","delegations","disabled_associations","doctor_especialities","doctors","documents","electricity_charge_types","electricity_companies","electricity_demand_levels","electricity_prices","electricity_rate_types","executing_works","finance_types","finances","fodes_cities_transfer_infos","fodes_cities_transfers","food_establishment_areas","food_establishment_health_communities","food_establishment_types","food_establishments","fovial_companies","health_establishments","hydro_departments","hydro_establishments","hydro_municipalities","hydro_prices","hydro_references","hydro_routes","hydro_zones","information_officers","information_standard_categories","information_standard_infos","information_standard_frames","information_standards","institution_consultants","institution_event_participants","institution_events","institution_information_standards_settings","institution_officials","institution_organizational_structures","institution_remunerations","institution_service_categories","institution_service_steps","institution_services","institution_travels","institution_types","institutions","lawyers","line_of_works","medicine_categories","medicines","nationalities","occupations","procurements","product_brands","product_categories","product_presentations","product_probes","products","radial_concessions","radial_frequencies","refuges","resources_to_private_recipients","risk_prevention_consultants","roads","school_infos","schools","shopping_establishments","solvent_companies","sports_federation_transfers","sports_grants","states","syndicate_categories","syndicates","telephone_companies_concessions","universities","woman_cities","woman_city_services"]
TABLES = {}
DEPENDENT_RELATIONSHIPS = {}

desc "Download the data from the API and converts it into No relational data"
task :download_data do
	puts "Retrieving Data from Open Government API...."
	total = ROUTES.length
	counter = 0.0
	percent = 0.0
	ROUTES.each do |route|
		get_data_from_api(route, percent)
		counter +=1.0
		percent = ((counter/total)*100.0).round(1)
		puts "Total Completed #{percent}%, #{route.titleize} completed"
	end
	puts ""
	puts "Adding nested Relations"
	ok = change_relational_fields_to_no_relational
	puts ""
	define_fields_for_mongoid_models
	if ok
		puts "Storing data into Mongo DB"
		store_data_on_mongo
	end
end

def get_data_from_api(route, percent = 0.0)
	begin
		# Getting the data from the API
		page = 1
		while true
			klass = route.singularize.classify.constantize
			data = klass.pull_data_from_open_gob_api(page)
			count = data.length
			puts "Total Completed #{percent}%,Route #{route.titleize}=> request done #{count} results"
			break if count == 0
			puts "Total Completed #{percent}%,Route #{route.titleize}=> Parsing the data to a hash"
			table = data.map{|record| [record["id"],record] }
			puts "Total Completed #{percent}%,Route #{route.titleize}=> Storing data on hash collection"
			TABLES[route] = TABLES[route].nil? ? table.to_h : TABLES[route].merge(table.to_h)
			
			if page == 1
				puts "Total Completed #{percent}%,Route #{route.titleize}=> Storing foreign keys on hash collection"
				DEPENDENT_RELATIONSHIPS[route] = data.first.keys.select{ |k| k =~/\w+_id/ and ROUTES.include?(k.gsub("_id","").pluralize) }.map{|relation| relation.gsub("_id","")} rescue []
			end
			page +=1
		end
	rescue Exception => e
		puts "#{route} failed"
		puts e.message
    puts e.backtrace
	end
end

def change_relational_fields_to_no_relational
	puts "Transforming Data from Relational to Documents...."
	total = TABLES.length
	counter = 0.0
	percent = 0.0
	TABLES.each_pair do |name, table|
		begin
			table.values.each do |record|
				DEPENDENT_RELATIONSHIPS[name].each do |relation|
					id = record["#{relation}_id"]
					table_index = relation.pluralize
					record[relation] =  TABLES[table_index][id]
				end
			end
			counter +=1.0
			percent = ((counter/total)*100.0).round(1)
			print "\r\r#{percent}% completed processing Table #{name.titleize} completed                                   "
		rescue Exception => e
			puts "\n#{name} failed"
			puts e.message
	    puts e.backtrace
	    return false
		end
	end
	return true
end

def define_fields_for_mongoid_models
	total = TABLES.length
	counter = 0.0
	percent = 0.0
	TABLES.each_pair.each do |name, records|
		klass = name.classify.constantize
		fields = records.first.last.keys.select{|k| k != "id" }
		klass.define_mongo_fields(fields)
		counter +=1.0
		percent = ((counter/total)*100.0).round(1)
		print "\r\r#{percent}% completed processing Table #{name.titleize}                              "
	end
end

def store_data_on_mongo
	total = TABLES.length
	counter = 0.0
	percent = 0.0
	TABLES.each_pair do |name, records|
		begin
			records.each do |record|
				record_value = record.last
				record_value.delete("id")
				klass = name.classify.constantize
				klass.create!(record_value)
			end
			counter +=1.0
			percent = ((counter/total)*100.0).round(1)
			print "\r\r#{percent}% completed processing Table #{name.titleize}                              "
		rescue Exception => e
			puts "\n#{name} failed"
			puts e.message
	    puts e.backtrace
		end
	end
	puts "Done!!!"
end
