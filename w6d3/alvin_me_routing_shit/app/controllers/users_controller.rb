class UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end
  def show
    user = User.find(params[:id]) 
    render json: user
  end
  def create
    user = User.new(user_params)

    if user.save
      redirect_to users_url(user.id)
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update 
    user = User.find(params[:id]) 

    if user.update(user_params)
        redirect_to users_url(user.id) 
    else
        render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :age, :name)
  end
end
