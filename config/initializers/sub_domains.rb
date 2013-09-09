require "#{Rails.application.root}/lib/subdomain.rb"

SubdomainFu.configure do |config|
  config.tld_sizes = {
      development: 1, # local.host
      test: 1,
      production: 1 # my_app.com
  }

  config.mirrors = ["www"]

  config.preferred_mirror = "www"
end