require "administrate/base_dashboard"

class ContentDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    category: Field::BelongsTo,
    location: Field::BelongsTo,
    id: Field::Number,
    source: Field::String,
    title: Field::String,
    media_url: Field::String,
    description: Field::Text,
    curated: Field::Boolean,
    category_id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :title,
    :location,
    :source,
    :id,

  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :category,
    :location,
    :id,
    :source,
    :title,
    :media_url,
    :description,
    :curated,
    :category_id,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :category,
    :location,
    :source,
    :title,
    :media_url,
    :description,
    :curated,
    :category_id,
  ].freeze

  # Overwrite this method to customize how contents are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(content)
  #   "Content ##{content.id}"
  # end
end
