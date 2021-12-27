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
    # render plain: params
    user = User.find_by(email: params[:email])

    if user.present? && user.authenticate(params[:password])
      session[:id]=user.id
      redirect_to :blog 
    else
      redirect_to :sign_in , notice: "Invalid email or password."
    end
  end

  def create
    # render plain: params
    @user  = User.new(user_params)

    if @user.save
      redirect_to log_in_path , notice: "Please Login to access your blogs."
    else
      render :index
    end
  end

  def delete_account
    @user = User.find_by(id: Current.user.id)       
    if @user.destroy
      redirect_to  user_index_path
    else
      redirect_to blog_path 
    end
  end



  private 
  def user_params
    params.require(:user).permit(:email,:password,:password_confirmation)
  end


end
