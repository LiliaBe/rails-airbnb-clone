class DashboardController < ApplicationController
  def profile
    @user = current_user
  end

  def rentals
    @user = current_user
    @rentals = @user.instruments
    # @bookings =
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
