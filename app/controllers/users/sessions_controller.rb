class Users::SessionsController < Devise::SessionsController

  before_action :save_logout_action, only: :destroy
  after_action :save_login_action, only: :create

  def save_login_action
    @user.update_attribute(:status, true)
    @user.create_activity key: 'user.status.online', owner: @user, params: { user: @user }
  end

  def save_logout_action
    @user = current_user
    @user.update_attribute(:status, false)
    @user.create_activity key: 'user.status.offline', owner: @user, params: { user: @user }
  end
end
