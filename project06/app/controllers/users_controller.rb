class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thank you for signing up! Please log in here."
      redirect_to new_session_path
    else
      render :action => 'new'
    end
  end
end
