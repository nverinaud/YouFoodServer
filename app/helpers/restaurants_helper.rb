#encoding: utf-8

module RestaurantsHelper
  def get_restaurant
    @restaurant = current_user.restaurant
  end
end