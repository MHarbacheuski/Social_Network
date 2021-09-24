class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    new_users_interest_path(resource)
  end

  def after_update_path_for(resource)
    profile_path(resource.profile.id)
  end

end
