class CreateIncidentals < ActiveRecord::Migration
  def change
    create_table :incidentals do |t|
      t.string :description
      t.decimal :cost

      t.timestamps
    end
  end
end
