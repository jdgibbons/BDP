class AddCompletionDateToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :completion_date, :date
  end
end
