# == Schema Information
#
# Table name: products
#
#  id           :integer         not null, primary key
#  price        :decimal(, )
#  name         :string(255)
#  abbreviation :string(255)
#  description  :text
#  photoURL     :string(255)
#  permanent    :boolean
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

class Product < ActiveRecord::Base

	attr_accessible :price, 
									:name, 
									:abbreviation, 
									:description, 
									:photoURL,
									:permanent

	# Validation
	validates :price, presence: true, numericality: { greater_than: 0.0 }
	validates :name, presence: true
	validates :abbreviation, length: { maximum: 10 }

end
