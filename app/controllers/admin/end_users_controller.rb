class Admin::EndUsersController < ApplicationController

def index
PER = 10
user = User.all
@users = User.page(params[:page]),per(PER)
@user = User.find(params[:id])

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
    user = user.find(current_user.id)
    user is_delete = remove
    user.save
    redirect_to admin_end_users_path
  end

private
def user_params
    params.require(:user).permit(:first_name, :last_name, :kana_first, :kana_last, :phone_numeber, :address, :postal_code, :email, :profile_image)
end 

end
