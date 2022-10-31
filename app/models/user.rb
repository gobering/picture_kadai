class User < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true, length:{maximum:50}
  before_validation { email.downcase! }
  validates :password, presence: true
end
