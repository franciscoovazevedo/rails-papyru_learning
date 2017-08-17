class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :teacher_subject
  validate :date_presence

  private

  def date_presence
    errors.add(:date, "Can't be in the past!") if date < Time.now
  end
end
