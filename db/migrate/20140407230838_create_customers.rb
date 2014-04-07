class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :contact
      t.string :telephone
      t.string :email

      t.timestamps
    end
  end
end
