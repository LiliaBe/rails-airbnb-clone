class InstrumentsController < ApplicationController
  def index
    if params[:category]
      @instruments = Instrument.where(category: params[:category])
    else
      @instruments = Instrument.all
    end
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.user = current_user
    if @instrument.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name, :category, :photo, :description, :price, :location)
  end
end
