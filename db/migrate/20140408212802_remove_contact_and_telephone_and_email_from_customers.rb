class RemoveContactAndTelephoneAndEmailFromCustomers < ActiveRecord::Migration
  def change
    remove_column :customers, :contact, :string
    remove_column :customers, :telephone, :string
    remove_column :customers, :email, :string
  end
end
