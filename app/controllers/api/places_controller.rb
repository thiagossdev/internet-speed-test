class Api::PlacesController < ApplicationController
  def index
    places = Place.all.map do |place|
      {
        id: place.external_id,
        name: place.name,
        city: place.city,
        address: place.address,
        most_recent_download_speed: most_recent_download_speed(place),
        most_recent_download_units: most_recent_download_units(place),
        number_of_measurements: number_of_measurements(place),
      }
    end

    render(json: { places: places })
  end

  private

  def most_recent_download_speed(place)
    # Assume that all the units are the same
    place.internet_speeds.order('created_at').last&.download_speed || 0
  end

  def most_recent_download_units(place)
    place.internet_speeds.order('created_at').last&.download_units || nil
  end

  def number_of_measurements(place)
    place.internet_speeds.count
  end
end