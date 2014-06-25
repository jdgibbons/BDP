class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.string :city
      t.integer :state
      t.string :zip_code
      t.integer :type

      t.timestamps
    end
  end
end
