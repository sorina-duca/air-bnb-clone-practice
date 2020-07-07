class Booking < ApplicationRecord
 belongs_to :users
 belongs_to :boats

 validates :checkin, :checkout, presence: { message: "Please select the date."}
end
