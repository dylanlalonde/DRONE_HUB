class Drone < ApplicationRecord
  include PgSearch
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_many :reviews, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  # SEARCH FUNCTIONALITY:
  pg_search_scope :search_by_name_and_description_and_category_and_location,
  against: [ :name, :description, :category, :location ],
  using: {
    tsearch: { prefix: true }
  }

  # validates :name, presence: true
  # validates :description, presence: true
  # validates :location, presence: true
  # validates :photo, presence: true
  # validates :price, presence: true
  # validates :category, presence: true  <==== NEW

  # MAP FUNCTIONALITY:
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

end
