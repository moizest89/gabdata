class OpenGobApiModelGenerator < Rails::Generators::Base
	ROUTES = ["academic_grades","accountants","budget_units","carreers","categories","cities","civil_organization_types","civil_organizations","companies","company_penalties","cooperative_types","cooperatives","cultural_fee_place_contacts","cultural_fee_places","cultural_fee_price_types","cultural_fee_types","cultural_fees","delation_infos","delation_institutions","delegation_infos","delegations","disabled_associations","doctor_especialities","doctors","documents","electricity_charge_types","electricity_companies","electricity_demand_levels","electricity_prices","electricity_rate_types","executing_works","finance_types","finances","fodes_cities_transfer_infos","fodes_cities_transfers","food_establishment_areas","food_establishment_health_communities","food_establishment_types","food_establishments","fovial_companies","health_establishments","hydro_departments","hydro_establishments","hydro_municipalities","hydro_prices","hydro_references","hydro_routes","hydro_zones","information_officers","information_standard_categories","information_standard_infos","information_standard_frames","information_standards","institution_consultants","institution_event_participants","institution_events","institution_information_standards_settings","institution_officials","institution_organizational_structures","institution_remunerations","institution_service_categories","institution_service_steps","institution_services","institution_travels","institution_types","institutions","lawyers","line_of_works","medicine_categories","medicines","nationalities","occupations","procurements","product_brands","product_categories","product_presentations","product_probes","products","radial_concessions","radial_frequencies","refuges","resources_to_private_recipients","risk_prevention_consultants","roads","school_infos","schools","shopping_establishments","solvent_companies","sports_federation_transfers","sports_grants","states","syndicate_categories","syndicates","telephone_companies_concessions","universities","woman_cities","woman_city_services"]

  def create_initializer_file
  	ROUTES.each do |model|
    	create_file "app/models/#{model.singularize}.rb", <<-FILE
require \"net/http\"
require \"uri\"
class #{model.classify}
  include Mongoid::Document

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  def self.define_mongo_fields( fields = [])
  	fields.each do |field|
  		self.field field.to_sym
		end
  end

  def self.pull_data_from_open_gob_api(page = 1)
      route = self.to_s.underscore.pluralize
      url_string = "http://api.gobiernoabierto.gob.sv/\#{route}?page=\#{page}"
      url = URI.parse(url_string)
      req = Net::HTTP::Get.new(url.path)
      req['Authorization'] = 'Token token="a1d461bec350c9a3ff62b6f684f10d5e"'
      http = Net::HTTP.new(url.host, url.port)
      res = http.request(req)
      data = JSON.parse res.body
  end
end
    FILE
  	end
  end
end