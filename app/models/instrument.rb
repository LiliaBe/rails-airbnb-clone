class Instrument < ApplicationRecord
  CATEGORY = ['Strings', 'Keyboard', 'Woodwind', 'Brass', 'Percussions', 'Amplification', 'Microphones', 'Cables & Accessories'].freeze
  belongs_to :user # 1/ creates a validation, instrument.user needs to exist! 2/ Gives access to instrument.users
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_one_attached :photo

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: Instrument::CATEGORY }
  validates :location, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true }

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :title, :category, :location, :description],
    using: {
      tsearch: { prefix: true }
    }
end
