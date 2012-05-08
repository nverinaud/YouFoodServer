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

require "rspec"

describe RestaurantManager do
  before do
    @restaurant_manager = RestaurantManager.new(name: "Restaurant manager", email: "restaurant.manager@youfood.com", password: "password")
  end
  subject { @restaurant_manager }

  it { should respond_to :restaurant }
end
