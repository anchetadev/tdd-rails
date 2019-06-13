class UsersController < ApplicationController
  def new
    render 'new'
  end
  def create
    @user = User.new(name:params[:Name],email:params[:Email], password:params[:Password], password_confirmation:params[:Password_Confirmation])  
    if @user && @user.password == @user.password_confirmation
      puts 'YOOOOOOOOOOOOOOOOOOOOO'
      return redirect_to '/sessions/new'
    end
    puts 'YEEEEEEEEEEEEEEEEEEEEEE'
    flash[:errors] = ["can't be blank text"]
    return redirect_to '/users/new'
  end

  def show
    render 'show'
  end

  def edit
    @user = User.find(session[:user_id])
    render 'edit'
  end
  def update
    @user = User.find(session[:user_id])
    @user.update(email:params[:Email])
    if @user.save
    # redirect_to "/users/#{session[:user_id]}/edit"
      @user.update(name:params[:Name])
      if @user.save
        return redirect_to "/users/#{session[:user_id]}"
      else
        flash[:errors]=["Name is invalid"]
        return redirect_to "/users/#{session[:user_id]}/edit"
      end
    else
      flash[:errors] =["Email is invalid"]
      redirect_to "/users/#{session[:user_id]}/edit"
    end

  end
  def destroy
    @user = User.find(session[:user_id])
    @user.destroy
    return redirect_to '/users/new'
  end
  private 
  def user_params
    params.permit(:name, :email, :password, :salt, :encrypted_password)
  end
end
