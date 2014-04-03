require 'paratrooper'

namespace :deploy do
  desc 'Deploy app in production environment'
  task :production do
    Paratrooper::Deploy.new("edc-herokuapp-com").deploy
  end
end