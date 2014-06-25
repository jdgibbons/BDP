# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    line1 "MyString"
    line2 "MyString"
    city "MyString"
    state 1
    zip_code "MyString"
    type 1
  end
end
