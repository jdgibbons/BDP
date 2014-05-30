# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wo_vendor do
    description "MyText"
    quantity 1
    cost "9.99"
    work_order_id 1
    total_cost "9.99"
  end
end
