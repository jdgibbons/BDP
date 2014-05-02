class AddOrderToVendor < ActiveRecord::Migration
  def change
    add_reference :vendors, :order, index: true
  end
end
