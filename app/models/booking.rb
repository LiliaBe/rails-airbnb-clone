require 'date'

class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :instrument

  has_one :review

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date

  scope :passed, -> { where("end_date < ?", Date.today) }
  scope :oncoming, -> { where("start_date > ?", Date.today) }
  scope :accepted, -> { where("accepted = true") }
  scope :answered, -> { where("answered = true") }
  scope :unanswered, -> { where("answered = false") }

  def duration
    (end_date - start_date).to_i
  end

  def total_price
    duration * instrument.price
  end

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end


end
