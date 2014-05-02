class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :material_line_items, dependent: :destroy
  has_many :labor_line_items, dependent: :destroy
  has_many :equipmental_line_items, dependent: :destroy
  has_many :vendors, dependent: :destroy
  has_one :work_order

  after_save :set_current_equipmentals_li_rate, :set_current_materials_li_rate,
             :set_current_labors_li_rate, :calculate_vendor_total, :calculate_cost_of_goods

  accepts_nested_attributes_for :equipmental_line_items, allow_destroy: true,
                                reject_if: proc { |attributes| attributes['quantity'].blank? }

  accepts_nested_attributes_for :labor_line_items, allow_destroy: true,
                                reject_if: proc { |attributes| attributes['quantity'].blank? }

  accepts_nested_attributes_for :material_line_items, allow_destroy: true,
                                reject_if: proc { |attributes| attributes['quantity'].blank? }

  accepts_nested_attributes_for :vendors, allow_destroy: true,
                                reject_if: proc { |attr| attr['description'].blank? ||
                                                         attr['quantity'].blank? ||
                                                         attr['cost'].blank? }

  def check_material_line_item(attributed)
    attributed['quantity'].blank? || Integer(attributed['quantity']) < 1
  end

  def order_number
    order_no = "BDP"

    # add id number with 6 leading zeros
    order_no += sprintf '%06i', id

    # if there is a work order, add a hyphen and then
    # the work order id with 6 leading zeros
    # !! This is not the final implementation !!
    if not work_order.nil?
      order_no += "-"
      order_no += work_order.id.to_s
    end

    # if there is an invoice, add a hyphen and then
    # the invoice id with 6 leading zeros
    # !! This is not the final implementation !!
    # if not invoice_id.nil?
    #   order_no += "-"
    #   order_no += invoice_id.to_s
    # end
    order_no
  end

  # the next 3 methods copy the current rate of
  # components and saves them in the order
  def set_current_equipmentals_li_rate
    equipmental_line_items.each do |equip|
      if equip.current_rate.nil?
        equip.current_rate = equip.equipmental.rate
      end
      equip.total_cost = (equip.current_rate * equip.quantity).round(2)
      equip.save
    end
  end

  def set_current_materials_li_rate
    material_line_items.each do |matter|
      if matter.current_rate.nil?
        matter.current_rate = matter.material.unit_price
      end
      matter.total_cost = (matter.current_rate * matter.quantity).round(2)
      matter.save
    end
  end

  def set_current_labors_li_rate
    labor_line_items.each do |lab|
      if lab.current_rate.nil?
        lab.current_rate = lab.labor.rate
      end
      lab.total_cost = (lab.current_rate * lab.quantity).round(2)
      lab.save
    end
  end

  def calculate_vendor_total
    vendors.each do |vendor|
      vendor.total_cost = (vendor.cost * vendor.quantity).round(2)
      vendor.save
    end
  end

  def calculate_cost_of_goods
    costiness = 0.00
    material_line_items.each do |matter|
      costiness += matter.total_cost
    end
    costiness *= 0.1
    if self.cost_of_goods != costiness
      self.cost_of_goods = costiness
      self.save
    end
  end
end

