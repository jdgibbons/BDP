class AddMarketAdjustmentToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :market_adjustment, :decimal, precision: 10, scale: 2
    add_column :orders, :cost_of_goods, :decimal, precision: 10, scale: 2
    add_column :orders, :sales_commission, :decimal, precision: 10, scale: 2
  end
end
