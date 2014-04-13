class CreateMaterialLineItems < ActiveRecord::Migration
  def change
    create_table :material_line_items do |t|
      t.references :material, index: true
      t.belongs_to :material_cart, index: true

      t.timestamps
    end
  end
end
