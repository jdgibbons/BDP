class RemoveMaterialCartFromMaterialLineItem < ActiveRecord::Migration
  def change
    remove_column :material_line_items, :material_cart_id, :integer
  end
end
