class User < ApplicationRecord
  has_secure_password
  has_many :activities
  has_many :categories, through: :activities
  validates :username, uniqueness: true
  validates :email, uniqueness: true
end
