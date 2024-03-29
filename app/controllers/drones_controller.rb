class DronesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_drone, only: [ :show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @drones = Drone.search_by_name_and_description_and_category_and_location("%#{params[:query]}%")
    else
      @drones = Drone.all
    end
    @markers = @drones.where.not(latitude: nil, longitude: nil).map do |drone|
      {
        lat: drone.latitude,
        lng: drone.longitude,
        infoWindow: { content: render_to_string(partial: "/drones/map_box", locals: { drone: drone }) }
      }
    end
  end

  def show
    @review = Review.new
  end

  def new
    @drone = Drone.new
  end

  def create
    @drone = Drone.new(drone_params)
    @drone.user = current_user
    if @drone.save

      redirect_to drone_path(@drone)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @drone.update(drone_params)
    redirect_to drone_path(@drone)
  end

  def destroy
    @drone.destroy
    redirect_to drones_path
  end

  private

  def set_drone
    @drone = Drone.find(params[:id])
  end

  def drone_params
    params.require(:drone).permit(:name, :price, :location, :photo, :description)
  end

end

