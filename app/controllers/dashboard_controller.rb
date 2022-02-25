class DashboardController < ApplicationController
  def profile
    @user = current_user
  end

  def rentals
    @user = current_user
    @rentals = @user.instruments
    @bookings = Booking.where(user: current_user, instrument: @instrument)
    @reviews = Review.all
  end

  def rented
    @user = current_user
    @rented = []
    @bookings = @user.bookings
    @bookings.each do |b|
      @rented << b.instrument
    end
  end
end
