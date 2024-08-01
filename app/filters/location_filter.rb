class LocationFilter
  include ActiveModel::Model
  #--------------------------------------------- MISC
  ADVANCED_FILTERS = [:daterange_from_to]
  attr_accessor :query, :latitude, :longitude, :distance

  #--------------------------------------------- VALIDATION

  #--------------------------------------------- METHODS
  def initialize(args)
    super(args)
  end

  def call(current_user:)
    # binding.pry

    locations = locations(current_user:)
    locations = filter_by_query(locations)
    locations = filter_nearby_locations(locations)
    locations
  end

  def locations(current_user:)
    Location.all
  end

  private

  def filter_by_query(locations)
    if query.present?
      locations = locations.where(
        'name ILIKE ? OR address ILIKE ?',
        "%#{query}%", "%#{query}%"
      )
    end
    locations
  end

  def filter_nearby_locations(locations)
    if latitude.present? && longitude.present? && distance.present?
      # lat = params[:latitude].to_f
      # lon = params[:longitude].to_f
      # distance = params[:distance].to_i

      distance_in_km = distance / 1000.0
      locations = locations.near([latitude, longitude], distance_in_km, units: :km)
    end

    locations
  end
end
