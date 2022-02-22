class InstrumentsController < ApplicationController

  def index
    raise
    @instruments = Instrument.where(:category => params[:filter_by])
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
