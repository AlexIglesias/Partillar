class Content < ActiveRecord::Base
  belongs_to :category
  belongs_to :location
  belongs_to :user

  validates :source, :title, :description, :category, :location, presence: true

  def self.search(query)
    if query.capitalize.blank?
      where('curated = true')
    else
      content_cache = $redis.get("search_#{query.capitalize}")
      if content_cache.nil?
        @content = Content.where('title LIKE ?', "%#{query.capitalize}%").where(curated: true)
        $redis.set("search_#{query.capitalize}", @content.to_json)
        @content
      else
        @content = JSON.parse(content_cache)[0][0]
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
