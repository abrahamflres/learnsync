class Professor < ApplicationRecord
  has_secure_password
  has_many :courses

  validates :first_name, :last_name, :email, :password_digest, presence: true
  validates :email, uniqueness: true
end
