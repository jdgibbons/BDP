class LaborLineItem < ActiveRecord::Base
  belongs_to :labor
  belongs_to :labor_cart
end
