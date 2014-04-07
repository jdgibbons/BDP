class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :name
      t.decimal :rate
      t.string :units

      t.timestamps
    end
  end
end
