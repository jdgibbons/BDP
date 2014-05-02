class MaterialLineItem < ActiveRecord::Base
  belongs_to :material
  belongs_to :order

  validates_presence_of :quantity
  validates_numericality_of :quantity
end
