# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    street_address1 "mystring"
    street_address2 "mystring"
    city "mystring"
    postal_code "5201"
    state "mystring"
    country "mystring"
    category "mystring"
  end
end
