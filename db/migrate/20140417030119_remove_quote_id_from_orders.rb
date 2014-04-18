class RemoveQuoteIdFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :quote_id, :integer
  end
end
