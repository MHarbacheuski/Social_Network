class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: :destroy

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = t('controllers.create')
      redirect_to users_path(current_user)
    else
      render 'new'
    end
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = t('controllers.update')
      redirect_to users_path(current_user)
    else
      render 'edit'
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def show
    @post = current_user.posts.find(params[:id])
    @comment = @post.comments.find(params[:id])
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    if @post.destroy
      flash[:notice] = t('controllers.destroy')
      redirect_to users_path(current_user)
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :picture, :heading)
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url if @post.nil?
  end

  def send_like_notification(user, post)
    unless user == current_user
      @notif = user.notifications.build(message: 'liked your post', url: url_for(post), sender_id: current_user.id)
      @notif.save
    end
  end
end
