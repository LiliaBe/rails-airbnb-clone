class InstrumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  skip_after_action :verify_policy_scoped, only: :index

  def index
    @instruments = Instrument.where(:category => params[:filter_by])
  end

  def new
    @instrument = Instrument.new
    authorize @instrument
  end

  def create
    @instrument = Instrument.new(params)
    @instrument.user = current_user
    authorize @instrument
    if @instrument.save
      redirect_to new_instrument_path
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

    # no need for app/views/instruments/update.html.erb
    redirect_to instrument_path(@instrument)
    authorize @instrument
  end

  def destroy
    @instrument = Instrument.find(params[:id])
    @instrument.destroy

    redirect_to instrument_path
    authorize @instrument
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name, :category, :location, :description, :rating, :price)
  end
end
