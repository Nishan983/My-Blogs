class UserController < ApplicationController
  def index
    @user = User.new
  end

  def signin
    render :signin
  end

  def logout 
    session[:id]= nil
    redirect_to sign_in_path
  end
  
  def login
    user = User.find_by(email: params[:email])

    if user.present? && user.authenticate(params[:password])
      session[:id]=user.id
      redirect_to :blog 
    else
      render :text => "Login unsucessful."
    end
  end

  def create
    # render plain: params
    @user  = User.new(user_params)

    if @user.save
      redirect_to log_in_path
    else
      render :index
    end
  end

  private 
  def user_params
    params.require(:user).permit(:email,:password)
  end


end
