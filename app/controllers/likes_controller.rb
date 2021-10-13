# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = t('controllers.like.create')
    else
      like = @post.likes.create(user_id: current_user.id)
      like.create_activity :create, owner: current_user
    end
    redirect_to profile_path(@post.profile.id)
  end

  def destroy
    if !already_liked?
      flash[:notice] = t('controllers.like.notice')
    else
      @like.create_activity :destroy, owner: current_user
      @like.destroy
    end
    redirect_to profile_path(@post.profile.id)
  end

  private

  def already_liked?
    Like.where(user_id: current_user.id, post_id:
      params[:post_id]).exists?
  end

  def find_like
    @like = @post.likes.find(params[:id])
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
