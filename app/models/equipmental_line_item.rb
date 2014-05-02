class EquipmentalLineItem < ActiveRecord::Base
  belongs_to :equipmental
  belongs_to :order

  validates_presence_of :quantity
  validates_numericality_of :quantity
end
