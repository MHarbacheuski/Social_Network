# frozen_string_literal: true

class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
    @comments = @post.comments
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post

    respond_to do |format|
      if @comment.save
        format.js
        format.html { redirect_to users_path, notice: 'Comment was successfully created.' }
      else
        flash[:alert] = 'One photo per comment and comments cannot be empty'
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @comments = @post.comments
    respond_to do |format|
      if @comment.destroy
        format.js
        # format.html { redirect_to users_path, notice: 'Comment was successfully deleted.' }
      else
        flash[:alert] = 'ggg'
      end
    end
  end

  def show
    @post = current_user.posts.find(params[:id])
    @comment = current_user.comments
    @comments = @post.comments
  end

  private

  def comment_params
    params.require(:comment).permit(:text_comment).merge(post_id: params[:post_id])
  end

end
