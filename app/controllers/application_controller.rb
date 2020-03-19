# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def after_sign_in_path_for(_resource)
    if current_user.has_role? :admin
      home_dashbords_path
    elsif current_user.has_role? :watchman
      visitors_path
    else
      users_path
    end
  end
end
