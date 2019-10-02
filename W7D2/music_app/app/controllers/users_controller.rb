

class UsersController < ApplicationController
    before_action :require_user!, only: [:show]
    
    def new
        @user = User.new
        render :new
    end

    def show
        @user = User.find(params[:id])
        render :show
    end

    def create 
        @user = User.new(users_params)
        if @user.save
            login!(@user)
            redirect_to user_url(@user) #user show page(that displays email)
        else
            render json: ['Requirements not met'], status: 412
        end
    end

    def users_params
        params.require(:user).permit(:email, :password)
    end
end
