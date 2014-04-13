class Customer < ActiveRecord::Base
  has_many :contacts, dependent: :destroy
  has_many :orders
  validates :name, presence: true
end
