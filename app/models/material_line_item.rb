class MaterialLineItem < ActiveRecord::Base
  belongs_to :material
  belongs_to :material_cart
end
