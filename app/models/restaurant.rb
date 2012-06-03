# encoding: utf-8

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
#  postal_code           :integer
#

class Restaurant < ActiveRecord::Base
  attr_accessible :name, :phone, :city, :postal_code, :address
  attr_accessible :restaurant_manager_attributes

  # Relations
  belongs_to :restaurant_manager
  has_many :cookers
  has_many :waiters
  has_many :zones
  has_many :tables
  has_many :invoices

  # Validation
  validates :name, presence: {message: "Le nom est requis."}
  validates :name, uniqueness: {case_sensitive: true, message: "Ce nom existe déjà."}
  validates :restaurant_manager_id, presence: {message: "Un manager est requis."}

  # Creation
  accepts_nested_attributes_for :restaurant_manager

  # Ordering
  default_scope order: 'restaurants.created_at DESC'

  # Utils
  def employees
    self.cookers | self.waiters
  end
end
