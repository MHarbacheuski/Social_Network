# frozen_string_literal: true
class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
  end

  def create
    @post = current_user.posts.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    if @comment.save
      redirect_to users_path(@post)
    else
      flash[:alert] = 'One photo per comment and comments cannot be empty'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @comment.destroy
    if @comment.destroy
      flash[:notice] = 'Comment successfully destroyed'
      redirect_to post_path(@post)
    end
  end

  def show
    @comment = current_user.comments.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text_comment, :post_id)
  end

end
