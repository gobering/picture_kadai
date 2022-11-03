class User < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true, length:{maximum:50}
  before_validation { email.downcase! }
  has_secure_password
  validates :password, length: { minimum: 6 }
  has_many :tasks, dependent: :destroy
  before_destroy :admin_user_destroy_action
  before_update :admin_user_update_action

  private

  def admin_user_update_action
    @admin_user = User.where(admin: true)
    if (@admin_user.count == 1 && @admin_user.first == self) && !(self.admin)      
      throw(:abort)        
    end
  end


  def admin_user_destroy_action
    if User.where(admin: true).count == 1 && self.admin
      throw(:abort)
    end
  end   
end
