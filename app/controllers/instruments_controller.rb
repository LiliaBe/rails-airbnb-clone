class InstrumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:category]
    @instruments = policy_scope(Instrument).where(category: params[:category])
    else
      @instruments = policy_scope(Instrument)
    end
  end

  def show
    @instrument = Instrument.find(params[:id])
    authorize @instrument
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
      redirect_to instruments_path
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

    redirect_to instrument_path
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name, :category, :location, :description, :rating, :price)
  end
end
