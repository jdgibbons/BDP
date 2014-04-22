class AddCurrentRateToMaterialLineItem < ActiveRecord::Migration
  def change
    add_column :material_line_items, :current_rate, :decimal, precision: 10, scale: 5
  end
end
