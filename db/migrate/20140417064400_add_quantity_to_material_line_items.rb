class AddQuantityToMaterialLineItems < ActiveRecord::Migration
  def change
    add_column :material_line_items, :quantity, :integer
  end
end
