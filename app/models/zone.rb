class Zone < ActiveRecord::Base
  attr_accessible :name

  # Relations
  belongs_to :restaurant

  #Constraints
end
