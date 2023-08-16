json.id place.external_id
json.extract! place, :city, :name, :address, :created_at, :updated_at
json.url place_url(place, format: :json)
