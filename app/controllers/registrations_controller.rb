# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user!

  protected

  def after_sign_up_path_for(resource)
    new_users_interest_path
  end

  def after_update_path_for(resource)
    profile_path(resource.profile.id)
  end
end
