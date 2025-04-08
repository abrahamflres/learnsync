class Course < ApplicationRecord
  belongs_to :professor
  has_many :enrollments
  has_many :students, through: :enrollments

  validates :course, presence: true, uniqueness: true
  validates :subjectcode, presence: true, uniqueness: true
end
