class Customer < ActiveRecord::Base
  validates :name, :contact, :telephone, :email, presence: true
end
