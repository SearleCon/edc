class WelcomeMailJob

  include SuckerPunch::Job

  def perform(user)
    UserMailer.welcome(user.id).deliver
  end

end