class UsersController < ApplicationController
  before_action :authenticate_user!, only:[:update,:show,:destroy]
  before_action :ensure_correct_user, only:[:edit,:update,:show]


  def show
    @user = User.find_by!(id: params[:id])
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find_by!(id: params[:id])
    @user.destroy!
    redirect_to root_url
  end

  private

    def user_params
      params.require(:user).permit(:name)
    end

    def ensure_correct_user
      if current_user.id != params[:id].to_i
      redirect_to(root_url)
      end
    end
end
