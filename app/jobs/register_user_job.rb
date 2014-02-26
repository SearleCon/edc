class RegisterUserJob

  include SuckerPunch::Job

  def perform(user, password)
    @password = password
    ManagementMailer.register_user(user.id, @password).deliver
  end

end