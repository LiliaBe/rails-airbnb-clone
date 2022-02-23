class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to instrument_path(instrument)
    else
      render "bookings/new"
    end
  end
end
