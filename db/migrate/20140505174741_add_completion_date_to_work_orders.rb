class AddCompletionDateToWorkOrders < ActiveRecord::Migration
  def change
    add_column :work_orders, :completion_date, :date
  end
end
