class CreateWoMaterialLineItems < ActiveRecord::Migration
  def change
    create_table :wo_material_line_items do |t|
      t.integer :work_order_id
      t.integer :quantity
      t.integer :material_id

      t.timestamps
    end
  end
end
