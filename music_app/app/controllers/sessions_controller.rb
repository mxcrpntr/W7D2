class SessionsController < ApplicationController

    def new
        @user = User.new
        render :new
    end
    def create
        email = params[:user][:email]
        password = params[:user][:password]
        @user = User.find_by_credentials(email,password)
        if @user
            login!(@user)
            redirect_to user_url(@user.id)
        else
            flash.now[:messages] = ['Invalid credentials.']
            render :new
        end
    end
    def destroy
        logout!
        session[:session_token] = nil
        current_user = nil
        redirect_to new_session_url
    end
end
