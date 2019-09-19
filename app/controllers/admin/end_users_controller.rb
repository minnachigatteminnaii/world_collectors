class Admin::EndUsersController < ApplicationController
  before_action :authenticate_administrator!

def index
  per = 20
  user = User.all
  @users = User.where(is_delete: 0).page(params[:page]).per(per)
end

def  show
 @user = User.find(params[:id])
end

def edit
 @user = User.find(params[:id])
end

def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have update user successfully."
      redirect_to admin_end_user_path(@user.id)
    else
      render :edit
    end
  end

def remove
    user = User.find(params[:id])
    user.is_delete = 1
    user.save
    redirect_to admin_end_users_path
  end

private
def user_params
    params.require(:user).permit(:first_name, :last_name, :kana_first, :kana_last, :phone_number, :address, :postal_code, :email, :profile_image)
end 

end
