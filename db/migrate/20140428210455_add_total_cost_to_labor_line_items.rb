class AddTotalCostToLaborLineItems < ActiveRecord::Migration
  def change
    add_column :labor_line_items, :total_cost, :decimal, precision: 10, scale: 2
  end
end
