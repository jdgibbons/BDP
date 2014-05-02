# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vendor do
    description "MyString"
    quantity 1
    cost "9.99"
  end
end
