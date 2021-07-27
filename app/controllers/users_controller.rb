# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.avatar.purge
    @user.avatar.attach(user_params[:avatar])
    if @user.update(user_params)
      flash[:notice] = t('controllers.successfully_updated')
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:bio, :birthday, :avatar, :username, :first_name, :second_name)
  end
end
