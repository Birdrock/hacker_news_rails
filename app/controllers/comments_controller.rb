class CommentsController < ApplicationController
  def index
  end

  def new
  end

  def show
    @post = Post.where(post_id: params[:id]).first
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def create
    @post = (params[:post_id])
    @comment = Comment.create(user_id: session[:user_id], post_id: params[:post_id], text: params[:comment][:text])
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
end
