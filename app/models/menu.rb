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
  has_many :schedules

end
