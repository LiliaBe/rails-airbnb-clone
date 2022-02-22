class PagesController < ApplicationController
  def home
    @instrument = Instrument.new
  end
end
