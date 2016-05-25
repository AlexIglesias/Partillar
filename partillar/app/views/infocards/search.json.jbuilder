json.infocards @infocard do |infocard|
	json.id infocard["id"]
	json.title infocard["title"]
	json.source infocard["source"]
	json.description infocard["description"]
	json.media_url infocard["media_url"]
	json.curated infocard["curated"]
	json.location infocard["location"] do
		json.name infocard["location"]["name"]
		json.latitude infocard["location"]["latitude"]
		json.longitude infocard["location"]["longitude"]
	end
	json.category infocard["category"] do
		json.name infocard["category"]["name"]
	end
end