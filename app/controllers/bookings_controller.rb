class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    authorize @booking
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @instrument = Instrument.find(params[:instrument_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.start_date = @booking.start_date.to_date
    @booking.end_date = @booking.end_date.to_date
    @booking.instrument = @instrument
    authorize @booking

    if @booking.save
      redirect_to instrument_path(@instrument)
    else
      render "instruments/show"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date,:end_date)
  end
end
