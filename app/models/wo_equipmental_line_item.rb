class WoEquipmentalLineItem < ActiveRecord::Base
  belongs_to :work_order
  belongs_to :equipmental

  validates_presence_of :quantity
  validates_numericality_of :quantity
end
