class Content < ActiveRecord::Base
  validates :source, :title, :description, :category, :location, presence: true

  belongs_to :category
  belongs_to :location
end
