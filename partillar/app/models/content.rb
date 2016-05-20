class Content < ActiveRecord::Base
  validates :source, :title, :description, :category, :location, presence: true

  belongs_to :category
  belongs_to :location

  def self.search(query)
    if query.capitalize.blank?
       where('curated = true')
    else
      where('title LIKE ? AND curated = true', "%#{query.capitalize}%")
    end
  end
end
