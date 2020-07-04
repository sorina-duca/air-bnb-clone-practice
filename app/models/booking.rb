class Booking < ApplicationRecord
 belongs_to :users
 belongs_to :boats

 validates :checkin, :checkout, presence: { message: "Please select the date."}
 validates :booking_price, presence: true
end
