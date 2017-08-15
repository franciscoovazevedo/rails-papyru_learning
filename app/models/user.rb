class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :photo, PhotoUploader
  has_many :lessons
  has_many :reviews
  has_many :teacher_subjects
  # has_many :lessons
  # has_many :reviews
  # has_many teacher_subjects if teacher == true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, :address, :phone_number, presence: true # maybe validate presence after for teacher
  validates_format_of :phone_number, :with => /\A(\+351)?(9|2)\d{8}\z/i

end
