class CreateEquipmentals < ActiveRecord::Migration
  def change
    create_table :equipmentals do |t|
      t.string :name
      t.decimal :rate
      t.string :units

      t.timestamps
    end
  end
end
