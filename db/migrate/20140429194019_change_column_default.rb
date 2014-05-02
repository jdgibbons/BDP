class ChangeColumnDefault < ActiveRecord::Migration
  def change
    change_column :orders, :incidentals, :decimal, :default => 0.00
  end
end
