class InstrumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present? && params[:category] == true
      sql_query = "name ILIKE :query OR description ILIKE :query OR category ILIKE :query"
      @instruments = policy_scope(Instrument).where(category: params[:category])
    elsif  params[:query].present?
      sql_query = "name ILIKE :query OR description ILIKE :query OR category ILIKE :query"
      @instruments = policy_scope(Instrument).where(sql_query, query: "%#{params[:query]}%")
    else
      @instruments = policy_scope(Instrument)
    end
  end

  def show
    @instrument = Instrument.find(params[:id])
    @bookings = Booking.where(user: current_user, instrument: @instrument)
    @reviews = Review.all
    authorize @instrument
    if @instrument.geocoded?
      @markers =
      [{
        lat: @instrument.latitude,
        lng: @instrument.longitude,
        image_url: helpers.asset_url("music_categories/drum-kit.png")
      }]
    else
       @markers = [{}]
    end
    @booking = Booking.new
    authorize @booking
  end

  def new
    @instrument = Instrument.new
    authorize @instrument
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.user = current_user
    authorize @instrument
    if @instrument.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @instrument = Instrument.find(params[:id])
    authorize @instrument
  end

  def update
    @instrument = Instrument.find(params[:id])
    @instrument.update(instrument_params)
    authorize @instrument

    # no need for app/views/instruments/update.html.erb
    redirect_to instrument_path(@instrument)
  end

  def destroy
    @instrument = Instrument.find(params[:id])
    @instrument.destroy
    authorize @instrument
    redirect_to root_path
  end

  private

  def instrument_params
    params.require(:instrument).permit(:photo, :name, :category, :location, :description, :rating, :price)
    end
end
