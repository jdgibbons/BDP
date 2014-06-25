class Customer < ActiveRecord::Base
  has_many :orders
  has_many :contacts, dependent: :destroy
  has_many :addresses, dependent: :destroy

  before_destroy :ensure_not_referenced_by_any_order

  accepts_nested_attributes_for :contacts, allow_destroy: true,
                                reject_if: proc { |attributes| attributes['name'].blank? }
  accepts_nested_attributes_for :addresses, allow_destroy: true,
                                reject_if: proc { |attributes| attributes['line1'].blank? }


  # validates :name, presence: true
  validates_presence_of :name

  private
  # ensure that there are no LLIs referencing this labor
  def ensure_not_referenced_by_any_order
    if orders.empty?
      return true
    else
      errors.add(:base, 'Customer has orders present')
      return false
    end
  end

end
