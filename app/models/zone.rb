class Zone < ActiveRecord::Base
  attr_accessible :name

  # Relations
  belongs_to :restaurant
  belongs_to :waiter

  #Constraints
  validates :name, presence: true, uniqueness: {case_sensitive: true}
  validates :restaurant_id, presence: true
  validates :waiter_id, presence: true
end
