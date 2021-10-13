# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :find_comment, only: %i[destroy update edit]
  before_action :find_post, only: %i[new create]

  def new
    @comment = @post.comments.build
    @comments = @post.comments
  end

  def create
    @comment = current_user.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        @comment.create_activity :create, owner: current_user, parameters: { post: @post }
        format.js
        format.html do
          redirect_to profile_path(@post.profile), notice: t('controllers.comment.success')
        end
        format.json { head :no_content }
      else
        format.js
        format.html do
          redirect_to profile_path(@post.profile), notice: t('controllers.comment.alert_create')
        end
      end
    end
  end

  def destroy
    respond_to do |format|
      @comment.create_activity :destroy, owner: current_user, parameters: { post: @post }
      if @comment.destroy
        format.js
        format.html { redirect_to @comment, notice: t('controllers.comment.success') }
        format.json { head :no_content }
      else
        flash[:alert] = t('controllers.comment.alert_destroy')
      end
    end
  end

  def update
    if @comment.update(comment_params)
      @comment.create_activity :update, owner: current_user, parameters: { post: @post }
      flash[:notice] = t('controllers.comment.alert_update')
      redirect_to profile_path(@post.profile)
    else
      flash[:alert] = t('controllers.comment.alert_update')
      render 'edit'
    end
  end

  def edit; end

  def show
    @post = current_user.posts.find(params[:id])
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_comment
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :picture).merge(post_id: params[:post_id])
  end
end
