class Menu < ActiveRecord::Base
  attr_accessible :name, :description, :default
  has_many :schedules

end
