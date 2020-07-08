class Booking < ApplicationRecord
 belongs_to :user
 belongs_to :boat

 validates :checkin, :checkout, presence: { message: "Please select the date."}
end
