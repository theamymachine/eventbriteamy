class UsersController < ApplicationController
  def new
  end

  def create
  end

  def show
    @user = User.find(params[:id])
  end

  def index
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path notice: "Votre profil a été mis à jour"
    else 
      render events_path 
    end

  end

  def delete
  end

private 

  def user_params

    params.require(:user).permit(:first_name, :last_name, :description)

  end

end
