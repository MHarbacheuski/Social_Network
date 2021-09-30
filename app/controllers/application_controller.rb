# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  around_action :switch_locale

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def after_sign_in_path_for(resource)
    user_path(resource)
    if @user.profile.presence
      profile_path(resource.profile.id)
    else
      Profile.create!(user_id: resource.id)
      new_users_interest_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:email, :password, :password_confirmation, profile_attributes: %i[first_name second_name avatar])
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:email, :password, :current_password)
    end
  end
end
