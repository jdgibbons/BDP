class CreateWorkOrders < ActiveRecord::Migration
  def change
    create_table :work_orders do |t|
      t.integer :invoice_id
      t.text :description
      t.string :quantity

      t.timestamps
    end
  end
end
