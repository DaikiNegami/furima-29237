class AddressesController < ApplicationController

  def create
    @address = ItemPurchase.new(address_params)
    if @address.save
      redirect_to root_path
    else
      render item_purchases_path(@item)
    end

  end

  private

  def address_params
    params.require(:item_purchase).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number).merge(purchase_id: params[:purchase_id])
  end
end
