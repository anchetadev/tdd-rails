class UsersController < ApplicationController
  def new
    flash[:notice] = ["First name can't be blank"]
    # flash[:notice] = ["Last name can't be blank"]
    flash[:notice] = ["Email can't be blank"]
    render 'new'
  end
  def create
    @user = User.new(params.require(:user).permit(:first_name, :last_name, :email))
    if @user.save
      flash[:notice] = ['User successfully created']
      flash[:notice]=['Welcome, shane']
      redirect_to user_path(@user)
    else
      redirect_to users_new_path
    end
  end
  def show 
    
    render 'new'
  end
end
