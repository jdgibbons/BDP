class Incidental < ActiveRecord::Base
  validates :description, :cost, presence: true
end
