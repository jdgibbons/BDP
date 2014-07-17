class Contact < ActiveRecord::Base
  belongs_to :customer

  # validates :name, presence: true
  validates_presence_of :first_name

  def name
    name = first_name
    if not last_name.nil?
      name += " "
      name += last_name
    end
    name
  end
end
