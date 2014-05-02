class WorkOrder < ActiveRecord::Base
  belongs_to :order
  has_many :wo_equipmental_line_items
  has_many :wo_labor_line_items
  has_many :wo_material_line_items

  after_save :copy_order_information

  def copy_order_information
    if quantity != order.quantity
      self.description = order.description
      self.quantity = order.quantity
      self.save

      order.equipmental_line_items.each do |equip|
        woli = WoEquipmentalLineItem.new
        woli.equipmental = equip.equipmental
        woli.quantity = equip.quantity
        self.wo_equipmental_line_items << woli
      end

      order.labor_line_items.each do |lab|
        woli = WoLaborLineItem.new
        woli.labor = lab.labor
        woli.quantity = lab.quantity
        self.wo_labor_line_items << woli
      end

      order.material_line_items.each do |matter|
        woli = WoMaterialLineItem.new
        woli.material = matter.material
        woli.quantity = matter.quantity
        self.wo_material_line_items << woli
      end
    end
  end

end
