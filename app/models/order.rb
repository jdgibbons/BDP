class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :material_line_items
  has_many :labor_line_items
  has_many :equipmental_line_items

  after_save :set_current_equipmentals_li_rate, :set_current_materials_li_rate,
             :set_current_labors_li_rate

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
      order_no += work_order_id.to_s
    end

    # if there is an invoice, add a hyphen and then
    # the invoice id with 6 leading zeros
    # !! This is not the final implementation !!
    if not invoice_id.nil?
      order_no += "-"
      order_no += invoice_id.to_s
    end
    order_no
  end

  def set_current_equipmentals_li_rate
    equipmental_line_items.each do |equip|
      if equip.current_rate.nil?
        equip.current_rate = equip.equipmental.rate
        equip.save
      end
    end
  end

  def set_current_materials_li_rate
    material_line_items.each do |matter|
      if matter.current_rate.nil?
        matter.current_rate = matter.material.unit_price
        matter.save
      end
    end
  end

  def set_current_labors_li_rate
    labor_line_items.each do |lab|
      if lab.current_rate.nil?
        lab.current_rate = lab.labor.rate
        lab.save
      end
    end
  end
end

