class UsersController < ApplicationController

    def show
      @user = User.find(params[:id])
    end
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(first_name:params[:first_name], last_name:params[:last_name], 
        age:params[:age], description:params[:description], email:params[:email], 
        password:params[:password], 
        password_confirmation:params[:password_confirmation], city: City.all.sample)
      if @user.save
        flash[:notice] = "You have created your account!"
        redirect_to root_path
      else 
        flash.now[:alert] = "Error please fill all the field!  :("
        render new_user_path
      end
    end
  
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :age, :description, :password, :password_confirmation)
    end
  
  end