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
    respond_to do |format|
      if @comment.save
        format.js
        format.html { redirect_to profile_path(@post.profile.id), notice: "Success" }
        format.json {head :no_content}
        # format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html
        # format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    respond_to do |format|
      if @comment.destroy
        format.js
        format.html { redirect_to  @comment, notice: "Success"}
        format.json { head :no_content }
      else
        flash[:alert] = 'ggg'
      end
    end
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = t('controllers.update')
      redirect_to profile_path(current_user.profile.id)
    else
      flash[:alert] = 'Please fill all fields correctly'
      render 'edit'
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def show
    @post = current_user.posts.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text_comment, :picture).merge(post_id: params[:post_id])
  end

end
