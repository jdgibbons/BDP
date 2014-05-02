# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :work_order do
    invoice_id 1
    description "MyText"
    quantity "MyString"
  end
end
