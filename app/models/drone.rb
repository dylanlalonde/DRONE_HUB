class Drone < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings

  # validates :name, presence: true
  # validates :description, presence: true
  # validates :location, presence: true
  # validates :photo, presence: true
  # validates :price, presence: true

end
