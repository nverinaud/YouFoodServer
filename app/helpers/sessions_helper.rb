# encoding: utf-8

module SessionsHelper

  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    current_user= user
  end

  def sign_out
    cookies.delete(:remember_token)
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= user_from_remember_token
  end

  def current_user?(user)
    user == current_user
  end

  def signed_in?
    !current_user.nil?
  end

  def signed_in_director?
    signed_in? && (current_user.is_a? Director)
  end

  def signed_in_manager?
    signed_in? && (current_user.is_a? Manager)
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_path, notice: "Veuillez vous connecter."
    end
  end

  def signed_in_director
    unless signed_in_director?
      store_location
      redirect_to signin_path, notice: "Veuillez vous connecter en tant que directeur."
    end
  end

  def signed_in_manager
    unless signed_in_manager?
      store_location
      redirect_to signin_path, notice: "Veuillez vous connecter en tant que gérant de restaurant."
    end
  end

  def current_user_portal_path
    if current_user.is_a? Director
      '/director'
    elsif current_user.is_a? RestaurantManager
      '/restaurant'
    elsif current_user.is_a? Cooker
      '/orders'
    end
  end


  private

  def user_from_remember_token
    remember_token = cookies[:remember_token]
    User.find_by_remember_token(remember_token) unless remember_token.nil?
  end

  def clear_return_to
    session.delete(:return_to)
  end
end