module BoatHelper
  def photo(boat, height, width)
    if boat.photo.attached?
      cl_image_tag boat.photo.key, height: height, width: width, crop: :fill
    else
      cl_image_tag 'no-boat-picture-01_zae6dt', height: height, width: width, crop: :fill
    end
  end

  def capacity(boat)
    "#{boat.name} can accomodate #{boat.capacity} people." if boat.capacity.present?
  end

  def description(boat)
    boat.description if @boat.description.present?
  end

  def edit_link?(boat)
    link_to "Update", edit_boat_path(boat), class: "btn btn-primary" if policy(boat).edit?
  end
end
