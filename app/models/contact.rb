class Contact < ActiveRecord::Base
  belongs_to :customer

  # validates :name, presence: true
  validates_presence_of :name
end
