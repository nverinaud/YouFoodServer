class Table < ActiveRecord::Base
  attr_accessible :name, :forks_nb, :zone_id

  #Relations
  belongs_to :restaurant
  belongs_to :zone

  #Constraints
  validates :name, presence: true, uniqueness: {case_sensitive: true}
  validates :restaurant_id, presence: true
end
