class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :name
      t.string :unit_type
      t.decimal :unit_price
      t.string :notes
      t.decimal :roll_cost

      t.timestamps
    end
  end
end
