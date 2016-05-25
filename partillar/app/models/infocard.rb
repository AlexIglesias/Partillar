class Infocard < ActiveRecord::Base
  belongs_to :category
  belongs_to :location
  belongs_to :user

  validates :source, :title, :description, :category, :location, presence: true

  def self.search(query)
    if query.capitalize.blank?
      where('curated = true')
    else
      infocard_cache = $redis.get("search_#{query.capitalize}")
      if infocard_cache.nil?
        @infocard = infocard.where('title LIKE ?', "%#{query.capitalize}%").where(curated: true)
        $redis.set("search_#{query.capitalize}", @infocard.to_json)
        @infocard
      else
        @infocard = JSON.parse(infocard_cache)[0][0]
      end
    end
  end

  private

  def redis
    $redis
  end

  def hash
    "redis_search_#{current_user}_#{query}"
  end
end
