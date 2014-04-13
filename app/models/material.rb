class Material < ActiveRecord::Base
  has_many :material_line_items

  before_destroy :ensure_not_referenced_by_any_material_line_item

  validates :name, :unit_price, :unit_type, presence: true

  private

  # ensure that there are no MLIs referencing this material
  def ensure_not_referenced_by_any_material_line_item
    if material_line_items.empty?
      return true
    else
      errors.add(:base, 'Material Line Items present')
    end
  end
end
