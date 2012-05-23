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

  # Relations
  belongs_to :restaurant_manager
  has_many :cookers

  # Validation
  validates :name, presence: {message: "Le nom est requis."}
  validates :name, uniqueness: {case_sensitive: true, message: "Ce nom existe déjà."}
  validates :restaurant_manager_id, presence: {message: "Un manager est requis."}

  # Creation
  #accepts_nested_attributes_for :restaurant_manager

  # Ordering
  default_scope order: 'restaurants.created_at DESC'

  def manager_name
  end

  def manager_password
  end

  def manager_password_confirmation
  end

  def manager_email
  end
end
