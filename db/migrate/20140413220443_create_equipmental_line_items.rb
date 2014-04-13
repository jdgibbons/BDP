class CreateEquipmentalLineItems < ActiveRecord::Migration
  def change
    create_table :equipmental_line_items do |t|
      t.references :equipmental, index: true
      t.belongs_to :equipmental_cart, index: true

      t.timestamps
    end
  end
end
