class UsersController < ApplicationController
  def show
  	@user = current_user
  end

  def edit
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
