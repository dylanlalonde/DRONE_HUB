class ReviewsController < ApplicationController
  def create
    @drone = Drone.find(params[:drone_id])
    @review = Review.new(review_params)
    @review.drone_id = @drone.id
    if @review.save!
      redirect_to drone_path(@drone)
    else
      render 'drones'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
