class Enrollment < ApplicationRecord
  belongs_to :student
  belongs_to :course

  validates :student_id, presence: true
  validates :course_id, presence: true
  has_one_attached :image

  validates :course_id, uniqueness: { scope: :student_id, message: "Enrollment Error: your currently enrolled" }
end
