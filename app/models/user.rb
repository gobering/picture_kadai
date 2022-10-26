class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, length:{maximum:50}
               format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  validates :password, presence: true
end
