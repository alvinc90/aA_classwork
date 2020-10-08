class Api::SessionsController < ApplicationController

    def create 
      @user = User.find_by_credentials(
        params[:user][:username],
        params[:user][:password]
      )

      if @user
        login!(@user)
        # render
      else
        flash.now [:errors] = ["Invalid Username"]
        # render
      end
    end

    def destroy 
        unless current_user
            flash[:errors] = status: 404
        end
        logout! 
    end
end
