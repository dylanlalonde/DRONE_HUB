class Drone < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  mount_uploader :photo, PhotoUploader

  # validates :name, presence: true
  # validates :description, presence: true
  # validates :location, presence: true
  # validates :photo, presence: true
  # validates :price, presence: true

end
