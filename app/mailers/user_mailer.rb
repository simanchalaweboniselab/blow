class UserMailer < ActionMailer::Base
  default from: "simanchala.pradhan@gmail.com"
  def welcome_email(user)
    @user = user
    mail(:to => user.email, :subject => "welcome to Blow Hip Hop")
  end
end
