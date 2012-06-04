# == Schema Information
#
# Table name: zones
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#  waiter_id     :integer
#  restaurant_id :integer
#

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
