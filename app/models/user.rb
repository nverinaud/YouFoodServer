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
end
