class AddCustomerToContact < ActiveRecord::Migration
  def change
    add_reference :contacts, :customer, index: true
  end
end
