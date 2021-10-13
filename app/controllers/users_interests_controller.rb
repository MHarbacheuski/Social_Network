# frozen_string_literal: true

class UsersInterestsController < ApplicationController
  def new
    @categories = Category.all.includes(:interests)
  end

  def create
    current_user.interest_ids = params[:interest_ids]
    if current_user.save
      current_user.create_activity key: 'user.interest.create', owner: current_user
      flash[:success] = t('controllers.user_interest.success_add_interest')
      redirect_to profile_path(current_user.profile.id) if current_user
    else
      flash.now[:error] = t('controllers.user_interest.error')
      render :new
    end
  end

  def update
    current_user.interest_ids = params[:interest_ids]
    if current_user.update
      current_user.interests.create_activity key: 'user.interest.update', owner: current_user
      flash[:notice] = t('controllers.user_interest.update')
      redirect_to profile_path(current_user.profile.id) if current_user
    else
      render 'edit'
    end
  end

  def edit
    @categories = Category.all.includes(:interests)
  end

  def show; end

  private

  def user_interest_params
    params.permit(:user_id, interest_ids: [])
  end
end
