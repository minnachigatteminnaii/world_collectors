class ShoppingAddressesController < ApplicationController
  before_action :authenticate_user!

	def index
		per = 9
	  @shopping_addresses = current_user.shopping_addresses.page(params[:page]).per(per)
  end

  def new
		@shopping_address = current_user.shopping_addresses.build
  end
  
	def create
 	  @shopping_address = current_user.shopping_addresses.build(shopping_address_params)
    if @shopping_address.save!
      flash[:notice] = "新しい発送先を登録しました。"
      redirect_to shopping_addresses_path
    else
      render 'new'
    end
  end

	def edit
		@shopping_address = ShoppingAddress.find(params[:id])
  end
  
	def update
      @shopping_address = ShoppingAddress.find(params[:id])
      if @shopping_address.update_attributes(shopping_address_params)
        flash[:notice] = "登録先情報を更新しました。"
        redirect_to edit_shopping_address_path(@shopping_address)
      else
        render 'edit'
      end
  end
  
	def destroy
		shopping_address = ShoppingAddress.find(params[:id]) 
    shopping_address.destroy
    redirect_to shopping_addresses_path
	end

private
def shopping_address_params
    params.require(:shopping_address).permit(:shopping_first_name, :shopping_last_name, :shopping_kana_first, :shopping_kana_last, :shopping_addresses_postal_code, :shopping_addresses_address, :shopping_addresses_phone_number)
end

end
