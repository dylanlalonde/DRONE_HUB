class Review < ApplicationRecord
  belongs_to :drone

  validates :content, length: { minimum: 10  }
end
