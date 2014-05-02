class Equipmental < ActiveRecord::Base
  has_many :equipmental_line_items
  has_many :wo_equipmental_line_items

  before_destroy :ensure_not_referenced_by_any_equipmental_line_item

  validates :name, :rate, :units, presence: true

  private

  # ensure that there are no ELIs referencing this equipment
  def ensure_not_referenced_by_any_equipmental_line_item
    if equipmental_line_items.empty? && wo_equipmental_line_items.empty?
      return true
    else
      errors.add(:base, 'Equipmental Line Items present')
    end
  end
end
