class ManagementMailer < ActionMailer::Base
  default from: "from@example.com"

  def register_user(user_id, password)
    @user = User.find(user_id)
    @password = password
    mail to: @user.email, subject: 'Registered'
  end

  def welcome(user_id)
    @user = User.find(user_id)
    mail to: @user.email, subject: "Welcome"
  end
end
