class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :fitgem_info
  helper_method :distance
  helper_method :avatar
  helper_method :climb

  def fitgem_info
    @fitgem_info = current_user.fitbit_data
  end

  def distance
    @distance = fitgem_info.activity_statistics['lifetime']['tracker']['distance']
  end

  def avatar
    @avatar = fitgem_info.user_info['user']['avatar']
  end

  def climb
    @climb = fitgem_info.activity_statistics['lifetime']['tracker']['floors'] * 10
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
