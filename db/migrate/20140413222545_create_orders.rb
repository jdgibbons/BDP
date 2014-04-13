class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :quote_id
      t.integer :work_order_id
      t.integer :invoice_id
      t.text :description
      t.integer :quantity

      t.timestamps
    end
  end
end
