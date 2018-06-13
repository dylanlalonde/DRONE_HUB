class PagesController < ApplicationController
  def home
    @drones = Drone.limit(4)
    @drones2 = Drone.where(category: "Delivery").limit(4)
  end
end
