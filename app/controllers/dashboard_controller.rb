class DashboardController < ApplicationController
  def profile
    @user = current_user
  end

  def rentals
    @user = current_user
    @rentals = @user.instruments
  end

  def rented
    @user = current_user
    @rented = []
    @user.bookings.each do |b|
      @rented << b.instrument
    end
  end

end
