class AddIncidentalsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :incidentals, :decimal, precision: 10, scale: 2
  end
end
