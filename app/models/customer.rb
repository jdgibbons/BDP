class Customer < ActiveRecord::Base
  has_many :orders
  has_many :contacts, dependent: :destroy

  accepts_nested_attributes_for :contacts, allow_destroy: true,
                                reject_if: proc { |attributes| attributes['name'].blank? }

  # validates :name, presence: true
  validates_presence_of :name
end
