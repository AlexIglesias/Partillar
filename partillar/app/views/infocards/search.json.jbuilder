json.infocards @infocard do |infocard|
	location = infocard["location"] || infocard[:location]
	category = infocard["category"] || infocard[:category]
	json.id infocard["id"] || infocard[:id]
	json.title infocard["title"] || infocard[:title]
	json.source infocard["source"] || infocard[:source]
	json.description infocard["description"] || infocard[:description]
	json.media_url infocard["media_url"] || infocard[:media_url]
	json.curated infocard["curated"] || infocard[:curated]
	if infocard["location"].nil?
		json.location_name infocard["location_name"] || infocard[:location_name]
		json.location_latitude infocard["location_latitude"] || infocard[:location_latitude] 
		json.location_longitude infocard["location_longitude"] || infocard[:location_longitude]
	end
	if infocard["category"].nil?
		json.category_name infocard["category_name"] || infocard[:category_name]
	end
end
