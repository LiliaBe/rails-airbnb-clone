class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :instrument
  validates :date, presence: true
end
