# frozen_string_literal: true

class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in? #что бы был доступ в представлении

  private

  def authenticate_user!
    unless current_user
      cookies[:previous_page] = request.url
      redirect_to login_path, alert: 'Are you Guru? Verify your email and password please.'
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
