class Student < ApplicationRecord
  belongs_to :user
  has_many :enrollments
  has_many :courses, through: :enrollments
  has_one_attached :image

  validates :firstname, :lastname, :yearstanding, :major, :degree, :user_id, presence: true

  def fullname
    "#{firstname}, #{lastname}"
  end
end
