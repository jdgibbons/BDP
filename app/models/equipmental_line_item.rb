class EquipmentalLineItem < ActiveRecord::Base
  belongs_to :equipmental
  belongs_to :equipmental_cart
end
