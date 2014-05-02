class RenameWorkOrderInvoiceIdToOrderId < ActiveRecord::Migration
  def change
    rename_column :work_orders, :invoice_id, :order_id
  end
end
