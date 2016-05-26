class Infocard < ActiveRecord::Base
  belongs_to :category
  belongs_to :location
  belongs_to :user
  validates :source, :title, :description, :category, :location, presence: true

  def self.search(query)
    if query.capitalize.blank?
      @infocard = where('curated = true')
      @infocard = Infocard.get_locations(@infocard.to_a)
    else
      infocard_cache = $redis.get("search_#{query.capitalize}")
      if infocard_cache.nil?
        @contents = Infocard.where('title LIKE ?', "%#{query.capitalize}%").where(curated: true)
        @infocard = Infocard.get_locations(@contents.to_a)
        $redis.set("search_#{query.capitalize}", @infocard.to_json)
        @infocard
      else
        @infocard = JSON.load(infocard_cache)
        @infocard
      end
    end
  end

  def self.get_locations(contents)
    infocards = []
    contents.each do |infocard|
      i = {
        id: infocard.id,
        title: infocard.title,
        source: infocard.source,
        description: infocard.description,
        media_url: infocard.media_url,
        curated: infocard.curated,
        location_name: infocard.location.name,
        location_latitude: infocard.location.latitude,
        location_longitude: infocard.location.longitude,
        category_name: infocard.category.name
      }
      infocards.push(i)
    end
    infocards
  end

  private
  def redis
    $redis
  end
end
