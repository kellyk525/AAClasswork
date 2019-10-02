



class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        user = User.find_by_credentials(params[:user][:email], params[:user][:password])

        if user
            login!(user)
            redirect_to user_url(user)
        else
            render json: ["username or password incorrect"], status: 412
        end
    end

    def destroy
        current_user.reset_session_token!
        session[:session_token] = nil
        redirect_to new_session_url
    end
end
