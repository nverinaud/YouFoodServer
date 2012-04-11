# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  number     :integer
#  email      :string(255)
#  type       :string(255)
#  name       :string(255)
#  phone      :string(255)
#  address    :string(255)
#  zipCode    :integer
#  city       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
  attr_accessible :id, :email, :password, :password_confirmation,
                  :type, :name, :phone, :address, :zipCode, :city
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true

  valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            presence: true,
            format: {with: valid_email_regex},
            uniqueness: {case_sensitive: false}

  validates :password,
            length: {minimum: 8}
end
