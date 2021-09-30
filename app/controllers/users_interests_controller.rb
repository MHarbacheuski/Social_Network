# frozen_string_literal: true

class UsersInterestsController < ApplicationController
  before_action :authenticate_user!

  def new
    @categories = Category.all.includes(:interests)
  end

  def create
    current_user.interest_ids = params[:interest_ids]
    if current_user.save
      flash[:success] = t('.new.success_add_interest')
      redirect_to profile_path(current_user.profile.id) if current_user
    else
      flash.now[:error] = t('.new.error')
      render :new
    end
  end

  def update
    current_user.interest_ids = params[:interest_ids]
    if current_user.update
      flash[:notice] = t('controllers.successfully_updated')
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
