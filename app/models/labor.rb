class Labor < ActiveRecord::Base
  validates :name, :rate, :units, presence: true
end
