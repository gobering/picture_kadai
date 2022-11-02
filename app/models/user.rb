class User < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true, length:{maximum:50}
  before_validation { email.downcase! }
  has_secure_password
  validates :password, length: { minimum: 6 }
  has_many :tasks, dependent: :destroy
end
