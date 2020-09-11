class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase = ItemPurchase.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase = ItemPurchase.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def purchase_params
    params.require(:item_purchase).permit(:token, :post_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_4c4f6d2a57b05977da374a77"
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency:'jpy'
    )
  end
end
