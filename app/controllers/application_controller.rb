# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale
  def after_sign_in_path_for(resource) # resource это объект класса user
    flash[:hello] = "Привет,#{resource.name}"
    if resource.admin?
      admin_root_path
    else
      root_path
    end

  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

  def default_url_options

    { lang: I18n.locale == I18n.default_locale ? {} : I18n.locale }
  end
end
