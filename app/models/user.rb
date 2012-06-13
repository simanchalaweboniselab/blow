class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable,  :lockable, :timeoutable and
  devise :database_authenticatable, :registerable,:confirmable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :authentication_token
  before_save :reset_authentication_token

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    if user = self.find_by_email(data.email)
      user
    else # Create a user with a stub password.
      self.create(:email => data.email, :password => Devise.friendly_token[0,20], :first_name => data.first_name, :last_name => data.last_name)
    end
  end
  #def admin?
  #  self.admin
  #end
  def set_attributes(email,password,first_name,last_name)
    self.email = email
    self.password = password
    self.first_name = first_name
    self.last_name = last_name
    self.save
  end
end
