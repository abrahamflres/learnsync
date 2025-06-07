class Todo < ApplicationRecord
  belongs_to :student

  validates :title, presence: true
end
