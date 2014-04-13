class EquipmentalCart < ActiveRecord::Base
  has_many :equipmental_line_items, dependent: :destroy
end
