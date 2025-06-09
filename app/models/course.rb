class Course < ApplicationRecord
  has_many :enrollments
  has_many :students, through: :enrollments


  validates :coursename, presence: true, uniqueness: true
  validates :subjectcode, presence: true

  def self.ransackable_attributes(auth_object = nil)
    [ "coursename", "description", "subjectcode", "created_at", "updated_at", "id" ]
  end
end
