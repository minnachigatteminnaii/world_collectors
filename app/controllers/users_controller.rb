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
  @user = User.find(current_user.id)
end

  	def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have update user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def unsubscribe
    user = current_user
    user.is_delete = 1
    user.save
    redirect_to logout_path
    # redirect_to shopping_addresses_path
  end 

  def order
    @orders = current_user.orders.page(params[:page]).per(5)
  end

private
def user_params
    params.require(:user).permit(:first_name, :last_name, :kana_first, :kana_last, :phone_numeber, :address, :postal_code, :email, :profile_image)
end

end
