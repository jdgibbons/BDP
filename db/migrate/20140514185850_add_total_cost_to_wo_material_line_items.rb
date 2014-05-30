class AddTotalCostToWoMaterialLineItems < ActiveRecord::Migration
  def change
    add_column :wo_material_line_items, :total_cost, :decimal, precision: 10, scale: 2
    add_column :wo_labor_line_items, :total_cost, :decimal, precision: 10, scale: 2
    add_column :wo_equipmental_line_items, :total_cost, :decimal, precision: 10, scale: 2
  end
end
