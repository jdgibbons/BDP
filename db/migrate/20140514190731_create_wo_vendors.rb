class CreateWoVendors < ActiveRecord::Migration
  def change
    create_table :wo_vendors do |t|
      t.text :description
      t.integer :quantity
      t.decimal :cost, precision: 10, scale: 2
      t.integer :work_order_id
      t.decimal :total_cost, precision: 10, scale: 2

      t.timestamps
    end
  end
end
