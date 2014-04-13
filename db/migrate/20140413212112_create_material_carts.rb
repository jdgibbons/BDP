class CreateMaterialCarts < ActiveRecord::Migration
  def change
    create_table :material_carts do |t|

      t.timestamps
    end
  end
end
