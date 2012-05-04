class Restaurant < ActiveRecord::Base
  attr_accessible :name, :phone, :city, :address

  # Relations
  belongs_to :restaurant_manager
  has_many :cookers

  # Validation
  validates :name, :phone, :city, :address, presence: true
  validates :name, uniqueness: {case_sensitive: true}
end
