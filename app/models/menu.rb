# == Schema Information
#
# Table name: menus
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  default     :boolean
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Menu < ActiveRecord::Base
  attr_accessible :name, :description, :default

  # Relations
  has_many :schedules
  has_and_belongs_to_many :products

end
