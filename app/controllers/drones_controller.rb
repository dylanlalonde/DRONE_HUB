class DronesController < ApplicationController
  before_action :set_drone, only: [ :show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      sql_query = Drone.search_by_name_and_description_and_category("%#{params[:query]}%")
      @drones = sql_query
    else
      @drones = Drone.all
    end
  end

  def show
  end

  def new
    @drone = Drone.new
  end

  def create
    @drone = Drone.new(drone_params)
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
    params.require(:drone).permit(:name, :price, :location, :photo)
  end

end

