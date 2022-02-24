class DashboardController < ApplicationController
  def rentals
    @user = current_user
    @rented = @user.instruments
  end

  def rented

  end
end
