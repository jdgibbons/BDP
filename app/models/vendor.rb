class Vendor < ActiveRecord::Base
  belongs_to :order

  validates_presence_of :description, :quantity, :cost
  validates_numericality_of :quantity, :cost

end
