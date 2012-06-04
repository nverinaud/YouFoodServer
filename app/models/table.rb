# == Schema Information
#
# Table name: tables
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  forks_nb      :integer
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#  restaurant_id :integer
#  zone_id       :integer
#

class Table < ActiveRecord::Base
  attr_accessible :name, :forks_nb, :zone_id

  #Relations
  belongs_to :restaurant
  belongs_to :zone

  #Constraints
  validates :name, presence: true, uniqueness: {case_sensitive: true}
  validates :restaurant_id, presence: true
end
