class AddressesController < ApplicationController

  def create
    @address = Address.create(address_params)
    if @address.save
      redirect_to root_path
    else
      render purchases_path
    end

  end

  private

  def address_params
    params.require(:address).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number).merge(purchase_id: params[:purchase_id])
  end
end
