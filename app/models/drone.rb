class Drone < ApplicationRecord
  include PgSearch
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings

  # SEARCH FUNCTIONALITY:
  pg_search_scope :search_by_name_and_description_and_category,
    against: [ :name, :description, :category ],
    using: {
      tsearch: { prefix: true }
    }

  # validates :name, presence: true
  # validates :description, presence: true
  # validates :location, presence: true
  # validates :photo, presence: true
  # validates :price, presence: true
  # validates :category, presence: true  <==== NEW

end
