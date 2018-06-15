class ReviewsController < ApplicationController
  def create
    @drone = Drone.find(params[:drone_id])
    @review = Review.new(review_params)
    @review.drone_id = @drone.id
    if @review.save
      respond_to do |f|
        f.html {redirect_to drone_path(@drone) }
        f.js
      end
    else
      respond_to do |f|
        f.html {render 'drones'}
        f.js
      end
    end
  end

    private

    def review_params
      params.require(:review).permit(:content)
    end
  end
