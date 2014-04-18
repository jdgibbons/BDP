class AddQuantityToEquipmentalLineItems < ActiveRecord::Migration
  def change
    add_column :equipmental_line_items, :quantity, :integer
  end
end
