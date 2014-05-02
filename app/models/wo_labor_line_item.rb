class WoLaborLineItem < ActiveRecord::Base
  belongs_to :work_order
  belongs_to :labor

  validates_presence_of :quantity
  validates_numericality_of :quantity

end
