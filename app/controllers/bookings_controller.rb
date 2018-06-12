class BookingsController < ApplicationController
  before_action :set_booking, only: [ :new, :create]

  def new
    @booking = Booking.new
    @users = User.all
  end

  def create
    @booking = Booking.new(booking_params)
    @user = User.find(dose_params[:user_id])
    @booking.user = @user
    @booking.drone = @drone
    if @booking.save
      redirect_to drone_path(@drone)
    else
      render "drones/show"
    end
  end

  def destroy
    @booking = booking.find(params[:id])
    @booking.destroy
    redirect_to drone_path(@booking.drone)
  end

  private

  def set_booking
    @Drone = Drone.find(params[:booking_id])
  end
  def booking_params
    params.require(:booking).permit(:status, :user_id)
  end

end
