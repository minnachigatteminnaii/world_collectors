class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
     unless @user.id == current_user.id
     redirect_to user_path(@current_user)
 end
  end

  def edit
  	@user = User.find(params[:id])
     unless @user.id == current_user.id
     redirect_to user_path(@current_user)
    end
  end

  def remove
  end

  def update
  	user = user.find(current_user.id)
  	user is_delete = remove
  	user.save
  	redirect_to shopping_addresses_path
  end
private
def user_params
    params.require(:user).permit(:first_name, :last_name, :kana_first, :kana_last, :phone_numeber, :address, :postal_code, :email, :profile_image)
end

end
