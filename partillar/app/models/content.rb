class Content < ActiveRecord::Base
  belongs_to :category
  belongs_to :location

  validates :source, :title, :description, :category, :location, presence: true


  def self.search(query)
    if query.capitalize.blank?
       where('curated = true')
    else
      where('title LIKE ? AND curated = true', "%#{query.capitalize}%")
    end
  end
end
