class AddOrderToLaborLineItem < ActiveRecord::Migration
  def change
    add_reference :labor_line_items, :order, index: true
  end
end
