class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :material_line_items
  has_many :labor_line_items
  has_many :equipmental_line_items

  accepts_nested_attributes_for :equipmental_line_items, allow_destroy: true

  accepts_nested_attributes_for :labor_line_items, allow_destroy: true

  accepts_nested_attributes_for :material_line_items, allow_destroy: true

  def order_number
    order_no = "BDP"

    # add id number with 6 leading zeros
    order_no += sprintf '%06i', id

    # if there is a work order, add a hyphen and then
    # the work order id with 6 leading zeros
    # !! This is not the final implementation !!
    if not work_order_id.nil?
      order_no += "-"
      order_no += sprintf '%06i', work_order_id
    end

    # if there is an invoice, add a hyphen and then
    # the invoice id with 6 leading zeros
    # !! This is not the final implementation !!
    if not invoice_id.nil?
      order_no += "-"
      order_no += sprintf '%06i', invoice_id
    end
    order_no
  end
end
