class SessionsController < ApplicationController
  before_filter :save_login_state, :only => [:login, :login_attempt]
  before_filter :authenticate_user, :only => [:new]

  def login
  end

  def login_user
    logged_user = User.authenticate(params[:email],params[:password])
    if logged_user
      session[:user_id] = logged_user.id
      flash[:notice] = "You have logged in as #{logged_user.name}"
      redirect_to(root_path)
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render "login"
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to :action => 'login'
  end
end
