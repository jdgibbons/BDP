class RemoveEquipmentalCartFromEquipmentalLineItem < ActiveRecord::Migration
  def change
    remove_column :equipmental_line_items, :equipmental_cart_id, :integer
  end
end
