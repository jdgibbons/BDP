# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wo_labor_line_item do
    work_order_id 1
    quantity 1
    labor_id 1
  end
end
