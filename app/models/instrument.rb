class Instrument < ApplicationRecord
  CATEGORY = ['Strings', 'Keyboard', 'Woodwind', 'Brass', 'Percussions', 'Amplification', 'Microphones', 'Cables & Accessories'].freeze
  belongs_to :user # 1/ creates a validation, instrument.user needs to exist! 2/ Gives access to instrument.users
  has_one_attached :photo
  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: Instrument::CATEGORY }
  validates :location, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
end
