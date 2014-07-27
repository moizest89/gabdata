task :seed_mongo => :environment do
	if Keyword.count == 0
		Keyword.create(keyword: "health", models: "Doctor,DoctorEspeciality,Medicine,MedicineCategory,HealthEstablishment,FoodEstablishment")
		Keyword.create(keyword: "education", models: "School,University")
		Keyword.create(keyword: "home_economy", models: "Product,Finance,Accountant")
		Keyword.create(keyword: "directories",models:"CivilOrganization,Delegation,Syndicate,Cooperative,DelationInstitution,Refuge,RiskPreventionConsultant,TelephoneCompaniesConcession,RadialFrequency,Road,DisabledAssociation,FovialCompany,WomanCity")
		Keyword.create(keyword: "sport_culture", models: "SportsGrant,SportsFederationTransfer,CulturalFeePlace")
	end
end