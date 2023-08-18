json.extract! internet_speed, :id
json.place_id internet_speed.place.external_id
json.extract! internet_speed, :download_speed, :download_units, :created_at, :updated_at
json.url internet_speed_url(internet_speed, format: :json)
