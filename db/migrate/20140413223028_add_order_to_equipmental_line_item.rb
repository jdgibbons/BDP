class AddOrderToEquipmentalLineItem < ActiveRecord::Migration
  def change
    add_reference :equipmental_line_items, :order, index: true
  end
end
