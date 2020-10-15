json.array! @boats do |boat|
  json.extract! boat, :id, :name, :latitude, :longitude, :user
end
