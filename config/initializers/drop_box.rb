Dropbox::API::Config.app_key    = Rails.application.secrets.dropbox_app_key
Dropbox::API::Config.app_secret = Rails.application.secrets.dropbox_app_secret
Dropbox::API::Config.mode       = Rails.application.secrets.dropbox_app_mode