class UsersController < ApplicationController
    def new
        @user = User.new
        render :new
    end
    def create
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            redirect_to user_url(@user.id)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end
    # def destroy
    #     user = User.find_by(id: params[:id])
    #     user.delete
    #     redirect_to users_url
    # end
    def show
        @user = User.find_by(id: params[:id])
        render :show
    end
    private
    def user_params
        params.require(:user).permit(:email,:password)
    end
end
