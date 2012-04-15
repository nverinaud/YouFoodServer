# == Schema Information
#
# Table name: categories
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Category < ActiveRecord::Base

	attr_accessible :name

	# Relationships
	has_many :products

	# Validation
	validates :name, presence: true, uniqueness: { case_sensitive: false }

end
