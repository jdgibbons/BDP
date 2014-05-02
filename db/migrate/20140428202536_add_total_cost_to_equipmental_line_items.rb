class AddTotalCostToEquipmentalLineItems < ActiveRecord::Migration
  def change
    add_column :equipmental_line_items, :total_cost, :decimal, precision: 10, scale: 2
  end
end
