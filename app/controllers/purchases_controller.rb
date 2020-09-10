class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase = ItemPurchase.new(user_id: purchase_params[:user_id], item_id: puchase_params[:item_id])
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render item_purchases_path(@item)
    end
  end
  
  private

  def purchase_params
    params.require(:item_purchase).permit(:token).merge(user_id: current_user.id, purchase_id: params[:purchase_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_4c4f6d2a57b05977da374a77"
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency:'jpy'
    )
  end
end
