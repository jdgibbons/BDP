class LaborLineItem < ActiveRecord::Base
  belongs_to :labor
  belongs_to :order
end
