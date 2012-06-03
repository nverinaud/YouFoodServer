#encoding: utf-8

module Api::ApiRestaurantHelper
  def api_valid_restaurant?
    if (!@restaurant)
      show_error "Vous ne pouvez pas acceder à cette ressouce.", 403
    end
  end

  def api_valid_zone?
    if (current_user.respond_to?(:zone))
      @zone = current_user.zone
    else
      show_error "Aucune zone attribuée.", 403
    end
  end
end