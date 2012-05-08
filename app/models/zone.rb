class Zone < ActiveRecord::Base
  attr_accessible :name

  # Relations
  belongs_to :restaurant
  belongs_to :waiter

  #Constraints
end
