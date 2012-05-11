class Zone < ActiveRecord::Base
  attr_accessible :name

  # Relations
  belongs_to :restaurant
  belongs_to :waiter
  has_many :tables

  #Constraints
  validates :name, presence: true, uniqueness: {case_sensitive: true}
  validates :restaurant_id, presence: true
end