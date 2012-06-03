# encoding: utf-8

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
#  restaurant_id   :integer
#

class User < ActiveRecord::Base
  attr_accessible :id, :email, :password, :password_confirmation,
                  :type, :name, :phone, :address, :zipCode, :city,
                  :remember_token
  has_secure_password
  before_save :create_remember_token

  # Validations
  validates :name, presence: { message: "Le nom est obligatoire." }
  validates :email, presence: { message: "L'email est obligatoire." }

  valid_email_regex = /\A[\w+\-._]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            format: { with: valid_email_regex, message: "L'email est invalide." },
            uniqueness: { case_sensitive: false, message: "Ce nom existe déjà." }

  validates :password,
            length: { minimum: 8, message: "8 caractères minimum." }

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
