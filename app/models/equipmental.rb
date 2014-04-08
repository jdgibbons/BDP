class Equipmental < ActiveRecord::Base
  validates :name, :rate, :units, presence: true
end
