class CreateEquipmentalCarts < ActiveRecord::Migration
  def change
    create_table :equipmental_carts do |t|

      t.timestamps
    end
  end
end
