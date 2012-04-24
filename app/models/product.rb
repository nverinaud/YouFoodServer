# == Schema Information
#
# Table name: products
#
#  id                 :integer         not null, primary key
#  price              :decimal(, )
#  name               :string(255)
#  abbreviation       :string(255)
#  description        :text
#  permanent          :boolean
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  category_id        :integer
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

class Product < ActiveRecord::Base

	attr_accessible :price, 
									:name, 
									:abbreviation, 
									:description, 
									:permanent,
									:category,
									:photo

	# Attachement
	has_attached_file :photo, 
										styles: { medium: '300x300>', thumb: '100x100>' },
										default_url: "/assets/empty-food-image.jpg"

	validates_attachment 	:photo,
  											content_type: { content_type: ['image/jpg', 'image/png'] },
  											size: { in: 0..2.megabytes }

	# Relationships
	belongs_to :category
	validates_associated :category

	# Validation
	validates :price, presence: true, numericality: { greater_than: 0.0 }
	validates :name, presence: true
	validates :abbreviation, length: { maximum: 10 }
	validates :category, presence: true

end
