class AddTotalCostToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :total_cost, :decimal, precision: 10, scale: 2
  end
end
