# frozen_string_literal: true

class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource) # resource это объект класса user
    flash[:hello] = "Привет,#{resource.name}"
    if resource.admin?
      admin_root_path
    else
      root_path
    end

  end
end
