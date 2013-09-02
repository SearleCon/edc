# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :alerts do
    content "MyString"
    active true
  end
end
