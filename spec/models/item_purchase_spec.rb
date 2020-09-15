require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  describe '商品購入情報の保存' do
    before do
      @item_purchase = FactoryBot.build(:item_purchase)
    end

    context "商品が出品できる場合" do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item_purchase).to be_valid
      end
    end

    context "商品が出品できない場合" do
      it 'tokenが空では保存できないこと' do
        @item_purchase.token = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空では保存できないこと' do
        @item_purchase.post_code = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeに-(ハイフン)がないと保存できないこと' do
        @item_purchase.post_code = '1234567'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Post code input correctly")
      end
      it "prefecture_idが0では登録できない" do
        @item_purchase.prefecture_id = 0
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Prefecture Select")
      end
      it 'cityが空では保存できないこと' do
        @item_purchase.city = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では保存できないこと' do
        @item_purchase.address = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では保存できないこと' do
        @item_purchase.phone_number = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberには-(ハイフン)が不要で11桁以内で入力しないと保存できないこと' do
        @item_purchase.phone_number = "090-1234-5678"
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone number is invalid. Input phone number within 11 digits")
      end
    end
  end
end

