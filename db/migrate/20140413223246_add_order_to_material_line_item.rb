class AddOrderToMaterialLineItem < ActiveRecord::Migration
  def change
    add_reference :material_line_items, :order, index: true
  end
end
