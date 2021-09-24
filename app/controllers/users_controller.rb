# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:search].present?
      User.reindex
      @users = User.search(params[:search], load: true)
    else
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
