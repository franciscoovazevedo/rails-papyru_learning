class Subject < ApplicationRecord
  has_many :teacher_subjects
  validates :name, presence: true
end
