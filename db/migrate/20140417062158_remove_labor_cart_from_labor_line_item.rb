class RemoveLaborCartFromLaborLineItem < ActiveRecord::Migration
  def change
    remove_column :labor_line_items, :labor_cart_id, :integer
  end
end
