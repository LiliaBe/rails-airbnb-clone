class Booking < ApplicationRecord
  belongs_to :user, :instrument
end
