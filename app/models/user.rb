class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :owned_drones, class_name: "Drone", dependent: :destroy
  has_many :bookings
  has_many :drones, through: :bookings

  # validates :photo, presence: true
  # validates :description, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
