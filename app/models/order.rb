class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :material_line_items, dependent: :destroy
  has_many :labor_line_items, dependent: :destroy
  has_many :equipmental_line_items, dependent: :destroy
  has_many :vendors, dependent: :destroy
  has_one :work_order, dependent: :destroy

  validates_presence_of :customer, :quantity
  validates_numericality_of :quantity

  after_save :check_for_duplicate_line_items, :set_current_equipmentals_li_rate, :set_current_materials_li_rate,
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

  # This is actually the order number without the work order or invoice numbers attached
  def quote_number
    quote_no = "BDP"
    quote_no += sprintf '%06i', id
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

  def check_for_duplicate_line_items
    if not material_line_items.nil?
      mlis = material_line_items.map { |mli| mli.material_id }
      mli_dupes = Array.new
      if mlis != mlis.uniq
        ml_size = material_line_items.size
        material_line_items.each_with_index do |matter, indy|
          ((indy + 1)..(ml_size - 1)).each do |innie|
            inner_mli = material_line_items.to_a[innie]
            if matter.material_id == inner_mli.material_id
              matter.quantity += inner_mli.quantity
              inner_mli.quantity = 0
              matter.save
              mli_dupes << inner_mli
            end
          end
        end
        mli_dupes.each do |d_mli|
          material_line_items.where(id: d_mli.id).delete_all
        end
      end
    end

    if not equipmental_line_items.nil?
      elis = equipmental_line_items.map { |eli| eli.equipmental_id }
      eli_dupes = Array.new
      if elis != elis.uniq
        el_size = equipmental_line_items.size
        equipmental_line_items.each_with_index do |equip, indy|
          ((indy + 1)..(el_size - 1)).each do |innie|
            inner_eli = equipmental_line_items.to_a[innie]
            if equip.equipmental_id == inner_eli.equipmental_id
              equip.quantity += inner_eli.quantity
              inner_eli.quantity = 0
              equip.save
              eli_dupes << inner_eli
            end
          end
        end
        eli_dupes.each do |d_eli|
          equipmental_line_items.where(id: d_eli.id).delete_all
        end
      end
    end

    if not labor_line_items.nil?
      llis = labor_line_items.map { |lli| lli.labor_id }
      lli_dupes = Array.new
      if llis != elis.uniq
        ll_size = labor_line_items.size
        labor_line_items.each_with_index do |lab, indy|
          ((indy + 1)..(ll_size - 1)).each do |innie|
            inner_lli = labor_line_items.to_a[innie]
            if lab.labor_id == inner_lli.labor_id
              lab.quantity += inner_lli.quantity
              inner_lli.quantity = 0
              lab.save
              lli_dupes << inner_lli
            end
          end
        end
        lli_dupes.each do |d_lli|
          labor_line_items.where(id: d_lli.id).delete_all
        end
      end
    end
  end
end

