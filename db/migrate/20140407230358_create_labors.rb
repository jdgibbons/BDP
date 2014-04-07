class CreateLabors < ActiveRecord::Migration
  def change
    create_table :labors do |t|
      t.string :name
      t.decimal :rate
      t.string :units

      t.timestamps
    end
  end
end
