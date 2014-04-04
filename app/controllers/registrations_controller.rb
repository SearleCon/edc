class RegistrationsController < Devise::RegistrationsController

  def create
    super { |resource| WelcomeMailJob.new.async.perform(resource) }
  end

end