class Enrollment < ApplicationRecord
  belongs_to :student
  belongs_to :course
  has_many :todos

  validates :student_id, presence: true
  validates :course_id, presence: true
  has_one_attached :image

  validates :course_id, uniqueness: { scope: :student_id, message: "Enrollment Error: your currently enrolled" }

  def self.ransackable_attributes(auth_object = nil)
    [ "course_id", "student_id", "note", "created_at", "updated_at", "id" ]
  end


  def self.ransackable_associations(auth_object = nil)
    [ "course",  "todos" ]
  end
end
