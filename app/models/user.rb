class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable,  :lockable, :timeoutable, :confirmable
  devise :database_authenticatable, :registerable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :authentication_token
  before_save :reset_authentication_token

  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true,
            :length => {:minimum => 6, :maximum => 40}

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
  #notes create new user
  def set_attributes(email,password,first_name,last_name)#called by sign_in api in apis controller
    self.email = email
    self.password = password
    self.first_name = first_name
    self.last_name = last_name
    self.save
  end
  def is_a_valid_email?(email)
    # Check the number of '@' signs.
    if email =~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i then
      return true
    else
      return false
    end
  end
  def check_password(password)
    if password.length >= 6
      return true
    else
      false
    end
  end
end
