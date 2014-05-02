class WoMaterialLineItem < ActiveRecord::Base
  belongs_to :work_order
  belongs_to :material

  validates_presence_of :quantity
  validates_numericality_of :quantity

end
