class Instrument < ApplicationRecord
  CATEGORY = ['Strings', 'Keyboard', 'Woodwind', 'Brass', 'Percussions', 'Amplification', 'Microphones', 'Cables & Accessories'].freeze
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :category, presence: true, uniqueness: true, inclusion: { in: Instrument::CATEGORY }
  validates :location, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
  validates :price, presence: true, uniqueness: true, numericality: { only_integer: true }

end
