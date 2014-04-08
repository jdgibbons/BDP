# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    name "Minuteman Press"
    contact "Chris Lewis"
    telephone "(425) 402-7900"
    email "eastlake@minutemanpress.com"
  end
end
