# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :material do
    name "Foam PVC white/Blk 5mm"
    unit_type "SQ FT"
    unit_price "1.14625"
    notes "4x8 sheet, skid pricing"
    roll_cost "36.68"
  end
end
