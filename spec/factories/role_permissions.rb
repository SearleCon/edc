# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :role_permission do
    role
    permission
  end
end
