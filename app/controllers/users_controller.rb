class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        
    end 
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(first_name:params[:first_name], email:params[:email],password:params[:password],password_confirmation:params[:password_confirmation])
        if @user.save             
            redirect_to root_path 
        else
            render new_user_path
        end
    end

    def user_params
        params.require(:user).permit(:first_name, :email,:password, :password_confirmation)
    end

end


