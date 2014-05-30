class Labor < ActiveRecord::Base
  has_many :labor_line_items
  has_many :wo_labor_line_items

  before_destroy :ensure_not_referenced_by_any_labor_line_item

  validates :name, :rate, :units, presence: true

  private

  # ensure that there are no LLIs referencing this labor
  def ensure_not_referenced_by_any_labor_line_item
    if labor_line_items.empty? && wo_labor_line_items.empty?
      return true
    else
      errors.add(:base, 'Labor Line Items present')
      return false
    end
  end
end
