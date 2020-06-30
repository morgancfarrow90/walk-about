class User < ApplicationRecord
  has_secure_password
  has_many :activities
  has_many :categories, through: :activities
  validates :email, uniqueness: true
  validates :username, :email, presence: true
end
