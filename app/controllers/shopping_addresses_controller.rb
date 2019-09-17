class ShoppingAddressesController < ApplicationController
	def index
		@user = User.find(params:[id])
	    @shopping_addresses = @user.shopping_addresses
	end
	def edit
		@shopping_addresses = Shopping_addresses.find(params:[id])
	end
	def update
	end
	def destroy
	end

private
def user_params
    params.require(:user).permit(:shopping_first_name, :shopping_last_name, :shopping_kana_first, :shopping_kana_last,  :shopping_addresses_postal_code,  :shopping_addresses_address, :shopping_addresses_phone_number )
end

end
