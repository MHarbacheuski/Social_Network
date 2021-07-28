class UsersInterestsController < ApplicationController
  before_action :authenticate_user!

  def new
    @user_interest = UserInterest.new
    @categories = Category.all.includes(:interests)
  end

  def create
    current_user.interest_ids = params[:interest_ids]
    if current_user.save
      flash[:success] = t('.new.success_add_interest')
      redirect_to user_path(current_user) if current_user
    else
      flash.now[:error] = t('.new.error')
      render :new
    end
  end

  def show; end

  private

  def user_interest_params
    params.permit(:user_id, interest_ids: [])
  end
end
