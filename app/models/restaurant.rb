# == Schema Information
#
# Table name: restaurants
#
#  id                    :integer         not null, primary key
#  created_at            :datetime        not null
#  updated_at            :datetime        not null
#  name                  :string(255)
#  city                  :string(255)
#  phone                 :string(255)
#  address               :string(255)
#  restaurant_manager_id :integer
#

class Restaurant < ActiveRecord::Base
  attr_accessible :name, :phone, :city, :address

  # Relations
  belongs_to :restaurant_manager
  has_many :cookers
  has_many :waiters
  has_many :zones

  # Validation
  validates :name, :phone, :city, :address, presence: true
  validates :name, uniqueness: {case_sensitive: true}
  validates :restaurant_manager_id, presence: true

  # Ordering
  default_scope order: 'restaurants.created_at DESC'

  # Utils
  def employees
    self.cookers | self.waiters
  end
end
