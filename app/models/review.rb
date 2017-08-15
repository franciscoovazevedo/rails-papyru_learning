class Review < ApplicationRecord
  belongs_to :user

  validates :rating, presence: true, numericality: true
  validates :content, presence: true
end