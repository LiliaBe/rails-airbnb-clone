class Instrument < ApplicationRecord
  CATEGORY = ['Strings', 'Keyboard', 'Woodwind', 'Brass', 'Percussions', 'Amplification', 'Microphones', 'Cables & Accessories'].freeze
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :category, presence: true, uniqueness: true, inclusion: { in: Instrument::CATEGORY }
end
