require "administrate/base_dashboard"

class SchoolDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    district: Field::BelongsTo,
    surveys: Field::HasMany,
    survey_responses: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    schid: Field::String,
    geometry: Field::String.with_options(searchable: false),
    # shed_05: Field::String.with_options(searchable: false),
    # shed_10: Field::String.with_options(searchable: false),
    # shed_15: Field::String.with_options(searchable: false),
    # shed_20: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    # muni_id: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :district,
    :surveys,
    :survey_responses,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :district,
    :surveys,
    :survey_responses,
    :id,
    :name,
    :schid,
    :geometry,
    # :shed_05,
    # :shed_10,
    # :shed_15,
    # :shed_20,
    :created_at,
    :updated_at,
    # :muni_id,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :district,
    :name,
    :schid,
    :geometry
  ].freeze

  # Overwrite this method to customize how schools are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(school)
    "#{school.name}"
  end
end
