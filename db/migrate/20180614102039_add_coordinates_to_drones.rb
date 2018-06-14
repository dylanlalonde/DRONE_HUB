class AddCoordinatesToDrones < ActiveRecord::Migration[5.2]
  def change
    add_column :drones, :latitude, :float
    add_column :drones, :longitude, :float
  end
end
