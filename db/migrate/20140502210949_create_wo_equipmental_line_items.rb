class CreateWoEquipmentalLineItems < ActiveRecord::Migration
  def change
    create_table :wo_equipmental_line_items do |t|
      t.integer :work_order_id
      t.integer :quantity
      t.integer :equipmental_id

      t.timestamps
    end
  end
end
