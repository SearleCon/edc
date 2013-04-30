# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :account do
    company "MyString"
    subdomain "mystring"
    drop_box_key 'mystring'
    drop_box_secret 'mystring'
  end
end
