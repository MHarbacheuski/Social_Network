# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :correct_user, only: :destroy
  before_action :find_post, only: %i[show edit update]
  before_action :find_profile, only: %i[new edit]

  def index
    if params[:search].present?
      @posts = Post.search(params[:search], load: true)
    else
      @profile = Profile.find(params[:id])
      @user = @profile.user
      @posts = @user.posts
    end
  end

  def new
    @post = current_user.posts.build(profile_id: params[:profile_id])
  end

  def create
    @profile = current_user.profile
    @post = current_user.posts.create(post_params)
    if @post.save
      if current_user.profile.id == params[:profile_id]
        @post.create_activity :create, owner: current_user, parameters: { post: @post }
      else
        @post.create_activity key: 'post.profile.create', owner: current_user, parameters: { post: @post }
      end
      flash[:notice] = t('controllers.post.create')
    else
      flash[:alert] =  t('controllers.post.not_create')
    end
    redirect_to profile_path(@post.profile.id)
  end

  def update
    @profile = current_user.profile
    if @post.update(post_params)
      if current_user.profile.id == params[:profile_id]
        @post.create_activity :update, owner: current_user, parameters: { post: @post }
      else
        @post.create_activity key: 'post.profile.update', owner: current_user, parameters: { post: @post }
      end
      flash[:notice] = t('controllers.post.update')
      redirect_to profile_path(@post.profile.id)
    else
      flash[:alert] = t('controllers.post.not_update')
      render 'edit'
    end
  end

  def edit; end

  def show
    #@comment = @post.comments.find(params[:id])
  end

  def destroy
    if current_user.profile.id == params[:profile_id]
      @post.create_activity :destroy, owner: current_user, parameters: { post: @post }
    else
      @post.create_activity key: 'post.profile.destroy', owner: current_user, parameters: { post: @post }
    end
    if @post.destroy
      flash[:notice] = t('controllers.post.destroy')
    else
      flash[:alert] = t('controllers.post.not_delete')
    end
    redirect_to profile_path(@post.profile.id)
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def find_profile
    @profile = Profile.find(params[:profile_id])
  end

  def post_params
    params.require(:post).permit(:content, :picture, :heading, :user_id, :profile_id)
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url if @post.nil?
  end
end
