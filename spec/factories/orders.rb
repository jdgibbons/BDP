# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    quote_id 1
    work_order_id 1
    invoice_id 1
    description "MyText"
    quantity 1
  end
end
