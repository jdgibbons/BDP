class LaborCart < ActiveRecord::Base
  has_many :labor_line_items, dependent: :destroy
end
