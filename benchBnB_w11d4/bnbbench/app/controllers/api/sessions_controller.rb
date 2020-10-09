class Api::SessionsController < ApplicationController
  # dont use flash for rendering errors. 
  # we are no longer using html


  # we make a req to server w ajax
  # hits controller action > controller gets info that is requested
  # controller sends a response with json OR thru a json.jbuilder 

  before_action :require_log_in!, only: [:destroy]

    def create 
      @user = User.find_by_credentials(
        params[:user][:username],
        params[:user][:password]
      )
      if @user
        login!(@user)
        render 'api/users/show'
      else
        render json: ["Invalid Username"], status: 404
      end
    end

    def destroy   
        logout! 
    end
end
