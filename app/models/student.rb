class Student < ApplicationRecord
  has_secure_password
  has_many :enrollments
  has_many :courses, through: :enrollments

  validates :first_name, :last_name, :email, :password, :year_standing, :major, :degree, presence: true
  validates :email, uniqueness: true
end
