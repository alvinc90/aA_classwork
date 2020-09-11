class UsersController < ApplicationController

    #do we need to write show/index? how do we know?
    #does it matter if we use flash or flash.now in create? (spec wise)
    #do we need to create a dummy in GET #new?
    #how do we know what to include in our views?

    def new
        @user = User.new #do we need this line of code?
        render :new
    end

    def show 
        @user = User.find(params[:id]) 
        render :show 
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages 
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
