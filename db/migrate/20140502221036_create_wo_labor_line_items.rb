class CreateWoLaborLineItems < ActiveRecord::Migration
  def change
    create_table :wo_labor_line_items do |t|
      t.integer :work_order_id
      t.integer :quantity
      t.integer :labor_id

      t.timestamps
    end
  end
end
