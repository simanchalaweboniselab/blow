class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at,
                  :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip
  # attr_accessible :title, :body
end
