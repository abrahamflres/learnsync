class Todo < ApplicationRecord
  belongs_to :student
  belongs_to :enrollment

  validates :title, presence: true
end
