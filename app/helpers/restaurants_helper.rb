#encoding: utf-8

module RestaurantsHelper
  def get_restaurant
    if (current_user.respond_to?(:restaurant))
      @restaurant = current_user.restaurant
    end
  end

  def valid_restaurant?
    if (!@restaurant)
      flash[:error] = "Vous n'êtes affecté à aucun restaurant. Contactez votre directeur."
      redirect_to root_path
    end
  end

end