class Course < ApplicationRecord
  has_many :enrollments
  has_many :students, through: :enrollments

  validates :coursename, presence: true, uniqueness: true
  validates :subjectcode, presence: true
end
