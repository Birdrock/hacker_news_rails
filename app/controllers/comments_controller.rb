class CommentsController < ApplicationController
  def index
  end

  def new
  end

  def show
    @post = Post.where(post_id: params[:id]).first

  end

  def create

    @post = (params[:post_id])
    @comment = Comment.create(user_id: session[:user_id], post_id: params[:post_id], text: params[:comment][:text])
    redirect_to post_path(@post)
  end
end
