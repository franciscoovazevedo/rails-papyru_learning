class TeacherSubject < ApplicationRecord
  belongs_to :subject
  belongs_to :user
  has_many :lessons

  validate :date_begin
  validate :date_end
  validates :price, numericality: true
  validates :description, length: { minimum: 100 }

  private

  def date_begin
    unless self.begin.nil?
      errors.add(:begin, "Can't be in the past!") if self.begin < Time.now
    end
  end

  def date_end
    unless self.end.nil?
      errors.add(:end, "Can't before the begining") if self.end < self.begin
    end
  end

end
