class Menu < ActiveRecord::Base
  attr_accessible :name, :description, :default
end
