class InstrumentsController < ApplicationController
  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    if @instrument.save
      redirect_to root_path
    else
      render :new
    end
  end
end
