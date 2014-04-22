class AddCurrentRateToLaborLineItem < ActiveRecord::Migration
  def change
    add_column :labor_line_items, :current_rate, :decimal, precision: 10, scale: 5
  end
end
