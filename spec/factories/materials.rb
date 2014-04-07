# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :material do
    name "MyString"
    unit_type "MyString"
    unit_price "9.99"
    notes "MyString"
    roll_cost "9.99"
  end
end
