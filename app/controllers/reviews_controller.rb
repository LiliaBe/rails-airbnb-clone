class ReviewsController < ApplicationController

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
    authorize @review
    # authorize @booking
  end

  def create
    @review = Review.new(review_params)
    authorize @review
    @booking = Booking.find(params[:booking_id])
    @instrument = @booking.instrument
    @review.booking = @booking
    if @review.save
      redirect_to instrument_path(@instrument)
    else
      render 'new'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    authorize @review
    @review.destroy
    redirect_to instrument_path(@review.booking)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
