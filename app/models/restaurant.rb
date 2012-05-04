class Restaurant < ActiveRecord::Base
  # Relations
  belongs_to :restaurant_manager
  has_many :cookers
end
