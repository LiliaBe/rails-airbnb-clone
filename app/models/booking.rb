class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :instrument
  has_one :review
end
