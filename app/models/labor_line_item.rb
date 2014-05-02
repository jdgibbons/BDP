class LaborLineItem < ActiveRecord::Base
  belongs_to :labor
  belongs_to :order

  validates_presence_of :quantity
  validates_numericality_of :quantity
end
