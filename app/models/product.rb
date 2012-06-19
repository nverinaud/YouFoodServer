# encoding: utf-8

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
  # Relations
  has_and_belongs_to_many :menus

  # Attachement
  has_attached_file :photo,
                    styles: {
                      medium: '300x300>', 
                      thumb: '100x100>'
                    },
                    default_url: "https://s3.amazonaws.com/"+ENV['S3_BUCKET_NAME']+"/empty-food-image.jpg",
                    storage: :s3,
                    bucket: ENV['S3_BUCKET_NAME'],
                    s3_credentials: {
                      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
                      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
                    }

  validates_attachment :photo,
                       content_type: {content_type: ['image/jpg', 'image/jpeg', 'image/png']},
                       size: {in: 0..2.megabytes}

  # Relationships
  belongs_to :category
  validates_associated :category

  # Validation
  validates :price, presence: {message: "Vous devez donner un prix."},
            numericality: {greater_than: 0.50,
                           message: "Le prix doit être supérieur à 0.50€."}
  validates :name, presence: {message: "Le nom est requis."}
  validates :abbreviation, length: {maximum: 10,
                                    message: "L'abbreviation ne doit pas excéder 10 caractères."}
  validates :category, presence: {message: "Vous devez choisir ou créer une catégorie."}

end
