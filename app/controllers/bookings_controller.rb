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
      redirect_to instruments_path
    else
      render :new
    end
  end
end
