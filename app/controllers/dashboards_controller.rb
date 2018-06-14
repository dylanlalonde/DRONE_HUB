class DashboardsController < ApplicationController

  def show
    @listings = current_user.owned_drones
    @rentals = current_user.bookings
  end

end
