class WorkOrder < ActiveRecord::Base
  belongs_to :order
  has_many :wo_equipmental_line_items, dependent: :destroy
  has_many :wo_labor_line_items, dependent: :destroy
  has_many :wo_material_line_items, dependent: :destroy
  has_many :wo_vendors, dependent: :destroy

  # validates_uniqueness_of :order_id, message: "already has an associated work order."

  after_create :copy_order_information
  after_update :check_for_duplicate_line_items, :set_current_wo_materials_li_rate, :calculate_wo_vendor_total,
               :set_current_wo_labors_li_rate, :set_current_wo_equipmentals_li_rate

  accepts_nested_attributes_for :wo_material_line_items, allow_destroy: true,
                                reject_if: proc { |attributes| attributes['quantity'].blank? }

  accepts_nested_attributes_for :wo_vendors, allow_destroy: true,
                                reject_if: proc { |attr| attr['description'].blank? ||
                                    attr['quantity'].blank? ||
                                    attr['cost'].blank? }

  accepts_nested_attributes_for :wo_labor_line_items, allow_destroy: true,
                                reject_if: proc { |attributes| attributes['quantity'].blank? }

  accepts_nested_attributes_for :wo_equipmental_line_items, allow_destroy: true,
                                reject_if: proc { |attributes| attributes['quantity'].blank? }

  def check_for_wo_uniqueness
    if not order.work_order.nil?

    end
  end

  def set_current_wo_materials_li_rate
    wo_material_line_items.each do |matter|
      if matter.current_rate.nil?
        matter.current_rate = matter.material.unit_price
      end
      matter.total_cost = (matter.current_rate * matter.quantity).round(2)
      matter.save
    end
  end

  def calculate_wo_vendor_total
    wo_vendors.each do |vendor|
      vendor.total_cost = (vendor.cost * vendor.quantity).round(2)
      vendor.save
    end
  end

  def set_current_wo_labors_li_rate
    wo_labor_line_items.each do |lab|
      if lab.current_rate.nil?
        lab.current_rate = lab.labor.rate
      end
      lab.total_cost = (lab.current_rate * lab.quantity).round(2)
      lab.save
    end
  end

  def set_current_wo_equipmentals_li_rate
    wo_equipmental_line_items.each do |equip|
      if equip.current_rate.nil?
        equip.current_rate = equip.equipmental.rate
      end
      equip.total_cost = (equip.current_rate * equip.quantity).round(2)
      equip.save
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
    if not wo_material_line_items.nil?
      mlis = wo_material_line_items.map { |mli| mli.material_id }
      mli_dupes = Array.new
      if mlis != mlis.uniq
        ml_size = wo_material_line_items.size
        wo_material_line_items.each_with_index do |matter, indy|
          ((indy + 1)..(ml_size - 1)).each do |innie|
            inner_mli = wo_material_line_items.to_a[innie]
            if matter.material_id == inner_mli.material_id
              matter.quantity += inner_mli.quantity
              inner_mli.quantity = 0
              matter.save
              mli_dupes << inner_mli
            end
          end
        end
        mli_dupes.each do |d_mli|
          wo_material_line_items.where(id: d_mli.id).delete_all
        end
      end
    end

    if not wo_equipmental_line_items.nil?
      elis = wo_equipmental_line_items.map { |eli| eli.equipmental_id }
      eli_dupes = Array.new
      if elis != elis.uniq
        el_size = wo_equipmental_line_items.size
        wo_equipmental_line_items.each_with_index do |equip, indy|
          ((indy + 1)..(el_size - 1)).each do |innie|
            inner_eli = wo_equipmental_line_items.to_a[innie]
            if equip.equipmental_id == inner_eli.equipmental_id
              equip.quantity += inner_eli.quantity
              inner_eli.quantity = 0
              equip.save
              eli_dupes << inner_eli
            end
          end
        end
        eli_dupes.each do |d_eli|
          wo_equipmental_line_items.where(id: d_eli.id).delete_all
        end
      end
    end

    if not wo_labor_line_items.nil?
      llis = wo_labor_line_items.map { |lli| lli.labor_id }
      lli_dupes = Array.new
      if llis != elis.uniq
        ll_size = wo_labor_line_items.size
        wo_labor_line_items.each_with_index do |lab, indy|
          ((indy + 1)..(ll_size - 1)).each do |innie|
            inner_lli = wo_labor_line_items.to_a[innie]
            if lab.labor_id == inner_lli.labor_id
              lab.quantity += inner_lli.quantity
              inner_lli.quantity = 0
              lab.save
              lli_dupes << inner_lli
            end
          end
        end
        lli_dupes.each do |d_lli|
          wo_labor_line_items.where(id: d_lli.id).delete_all
        end
      end
    end
  end


  def copy_order_information
    self.description = order.description
    self.quantity = order.quantity
    self.completion_date = order.completion_date
    self.save

    order.equipmental_line_items.each do |equip|
      woli = WoEquipmentalLineItem.new
      woli.equipmental = equip.equipmental
      woli.quantity = equip.quantity
      woli.current_rate = equip.current_rate
      woli.total_cost = equip.total_cost
      self.wo_equipmental_line_items << woli
    end

    order.labor_line_items.each do |lab|
      woli = WoLaborLineItem.new
      woli.labor = lab.labor
      woli.quantity = lab.quantity
      woli.current_rate = lab.current_rate
      woli.total_cost = lab.total_cost
      self.wo_labor_line_items << woli
    end

    order.material_line_items.each do |matter|
      woli = WoMaterialLineItem.new
      woli.material = matter.material
      woli.quantity = matter.quantity
      woli.current_rate = matter.current_rate
      woli.total_cost = matter.total_cost
      self.wo_material_line_items << woli
    end

    order.vendors.each do |vendi|
      woli = WoVendor.new
      woli.description = vendi.description
      woli.quantity = vendi.quantity
      woli.cost = vendi.cost
      woli.total_cost = vendi.total_cost
      self.wo_vendors << woli
    end
  end

end
