class RemoveWorkOrderIdAndInvoiceIdFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :work_order_id, :integer
    remove_column :orders, :invoice_id, :integer
  end
end
