class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :description
      t.integer :quantity
      t.decimal :cost, precision: 10, scale: 5

      t.timestamps
    end
  end
end
