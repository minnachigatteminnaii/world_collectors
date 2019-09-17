class ShoppingAddressesController < ApplicationController
	def index
		PER = 9
		@user = User.find(params:[id])
	    @shopping_addresses = @user.shopping_addresses
	    @shopping_address Shopping_address.page(params[:page]),per(PER)

	end
	def create
 	@shopping_addresses = Shopping_addresses.new(shopping_addresses_params)
    @shopping_addresses.user_id = current_user.id
    if @shopping_addresses.save
      flash[:notice] = "新しい発送先を登録しました。"
      redirect_to shopping_addresses_path
    else
      render :new
    end
   end
	def edit
		@shopping_addresses = Shopping_addresses.find(params:[id])
	end
	def new
		@shopping_addresses = Shopping_addresses.new
	end
	def update
      @shopping_addresses = Shopping_addresses.find(params[:id])
      @shopping_addresses.user_id = current_user.id
      if @shopping_addresses.update(shopping_address_params)
        flash[:notice] = "登録先情報を更新しました。"
        redirect_to shopping_address_path
      else
       render :edit
      end
	end
	def destroy
		shopping_addresses = Shopping_addresses.find(params[:id]) 
        shopping_addresses.destroy
        redirect_to shopping_addresses_path
	end

private
def user_params
    params.require(:user).permit(:shopping_first_name, :shopping_last_name, :shopping_kana_first, :shopping_kana_last,  :shopping_addresses_postal_code,  :shopping_addresses_address, :shopping_addresses_phone_number )
end

end
