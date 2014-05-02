# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wo_material_line_item do
    work_order_id 1
    quantity 1
    material_id 1
  end
end
