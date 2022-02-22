class InstrumentsController < ApplicationController
  # authorize @instruments
  skip_before_action :authenticate_user!, only: :index
  skip_after_action :verify_policy_scoped, only: :index
  def index
    Instrument.all
  end

  def new
    @instrument = Instrument.new
    authorize @instruments
  end

  def create
    # @record = Record.new(params)

    # if @record.save
    #   redirect_to [une nouvelle page]
    # else
    #   render :new
    # end

  end

  def update
    @instrument = Instrument.find(params[:id])
    authorize @instrument
  end
end
