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
    if @comment.save
      redirect_to profile_path(@post.profile), notice: t('controllers.comment.success')
    else
      redirect_to profile_path(@post.profile), notice: t('controllers.comment.alert_create')
    end
  end

  def destroy
    respond_to do |format|
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
