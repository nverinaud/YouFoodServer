require "rspec"

describe RestaurantManager do
  before do
    @restaurant_manager = RestaurantManager.new(name: "Restaurant manager", email: "restaurant.manager@youfood.com", password: "password")
  end
  subject { @restaurant_manager }

  it { should respond_to :restaurant }
end
