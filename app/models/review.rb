class Review < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  validates :rating, presence: true, numericality: true
  validates :content, presence: true
end
