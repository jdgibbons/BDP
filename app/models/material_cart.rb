class MaterialCart < ActiveRecord::Base
  has_many :material_line_items, dependent: :destroy
end
