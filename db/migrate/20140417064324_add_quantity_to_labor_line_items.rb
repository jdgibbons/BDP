class AddQuantityToLaborLineItems < ActiveRecord::Migration
  def change
    add_column :labor_line_items, :quantity, :integer
  end
end
