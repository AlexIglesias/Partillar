json.contents @content do |content|
	json.id content.id
	json.title content.title
	json.source content.source
	json.description content.description
	json.media_url content.media_url
	json.curated content.curated
	json.location do
		json.name content.location.name
		json.latitude content.location.latitude
		json.longitude content.location.longitude
	end
	json.category content.category.name
end