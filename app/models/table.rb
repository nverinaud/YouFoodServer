class Table < ActiveRecord::Base
  attr_accessible :name, :forks_nb

  #Relations
  belongs_to :restaurant
  belongs_to :zone

  #Constraints
  validates :name, presence: true, uniqueness: {case_sensitive: true}
  validates :restaurant_id, presence: true
  validates :zone_id, presence: true
end
