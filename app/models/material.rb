class Material < ActiveRecord::Base
  validates :name, :unit_price, :unit_type, presence: true
end
