class Todo < ApplicationRecord
  belongs_to :student
  belongs_to :enrollment

  validates :title, presence: true

  delegate :course, to: :enrollment, allow_nil: true

  def self.ransackable_attributes(auth_object = nil)
    [ "title", "description", "due_date", "completed", "course_id", "enrollment_id" ]
  end
  def self.ransackable_associations(auth_object = nil)
    [ "enrollment" ]
  end
end
