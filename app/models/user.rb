# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  email           :string(255)
#  type            :string(255)
#  name            :string(255)
#  phone           :string(255)
#  address         :string(255)
#  zipCode         :integer
#  city            :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#  remember_token  :string(255)
#  push_url        :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :id, :email, :password, :password_confirmation,
                  :type, :name, :phone, :address, :zipCode, :city,
                  :remember_token
  has_secure_password
  before_save :create_remember_token

  validates :name, presence: true
  validates :email, presence: true

  valid_email_regex = /\A[\w+\-._]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            presence: true,
            format: {with: valid_email_regex},
            uniqueness: {case_sensitive: false}

  validates :password,
            length: {minimum: 8}

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
