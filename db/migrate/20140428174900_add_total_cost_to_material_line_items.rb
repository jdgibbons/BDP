class AddTotalCostToMaterialLineItems < ActiveRecord::Migration
  def change
    add_column :material_line_items, :total_cost, :decimal, precision: 10, scale: 2
  end
end
