class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def create
    @post = Post.create(
      user_id: session[:user_id],
      url: params[:post][:url],
      title: params[:post][:title],
      body: params[:post][:body] )

    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.all
  end
end
