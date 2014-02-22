class RegistrationsController < Devise::RegistrationsController

  def new
   resource = build_resource(role: default_role)
   respond_with resource
  end

  def create
    super { |resource| WelcomeMailJob.new.async.perform(resource) }
  end

  private
   def default_role
     Role.find_by(name: :exec)
   end
end