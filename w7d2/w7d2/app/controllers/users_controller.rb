class UsersController < ApplicationController
    before_action :require_logged_in!, only: [:show, :destroy] 
    def new
        @user = User.new
        render :new
    end

    def show 
        @user = User.find(params[:id]) 
        render :show 
    end

    def create
        @user = User.create(user_params)
        if @user
            redirect_to user_url(@user.id)  
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new 
        end
    end

    def user_params
        params.require(:user).permit(:email, :password)
    end
end
