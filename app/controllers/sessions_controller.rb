class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.where(email: params[:session][:email]).first
    # binding.pry

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_path
      # binding.pry
    else
      render 'new'
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
