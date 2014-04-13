class CreateLaborCarts < ActiveRecord::Migration
  def change
    create_table :labor_carts do |t|

      t.timestamps
    end
  end
end
