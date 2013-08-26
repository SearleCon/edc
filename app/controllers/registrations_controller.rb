class RegistrationsController < Devise::RegistrationsController

  def new
   resource = build_resource({})
   resource.initialize_addresses
   resource.build_account
   respond_with resource
  end

  def create
    super
    Delayed::Job.enqueue WelcomeMailJob.new(resource.id) unless resource.invalid?
  end

  protected
  def after_sign_up_path_for(resource_or_scope)
    root_url(subdomain: resource_or_scope.subdomain)
  end

end