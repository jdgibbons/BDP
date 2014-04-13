class CreateLaborLineItems < ActiveRecord::Migration
  def change
    create_table :labor_line_items do |t|
      t.references :labor, index: true
      t.belongs_to :labor_cart, index: true

      t.timestamps
    end
  end
end
