class ChangeStatusInBooking < ActiveRecord::Migration[5.2]
  def change
    puts "changing"
    remove_column :bookings, :status
    add_column :bookings, :status, :string, default: "pending"
    puts "changed"
  end
end
