class UsersController < ApplicationController
  def new
    @user = User.new
    respond_to do |format|
      format.html
      format.json  { render :json => @user }
    end
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html  { redirect_to(root_path,
                      :notice => 'You signed up succsessfuly.') }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @user.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
