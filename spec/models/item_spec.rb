require 'rails_helper'

RSpec.describe Item, type: :model do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/sample1.png')
    end

    describe '商品の出品' do
      context "商品が出品できる場合" do
        it "image、name、describe、category_id、condition_id、shipping_burden_id、prefecture_id、handling_time_id、priceが存在すれば出品できる" do
          expect(@item).to be_valid
        end
      end

      context "商品が出品できない場合" do
        it "imageが空だと登録できない" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it "nameが空では登録できないこと" do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it "nameが40字以上だと登録できない" do
          @item.name = "あああああああああああああああああああああああああああああああああああああああああ"
          @item.valid?
          expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
        end
        it "descriptionが空では登録できない" do
          @item.description = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end
        it "category_idが0では登録できない" do
          @item.category_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("Category Select")
        end
        it "condition_idが0では登録できない" do
          @item.condition_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition Select")
        end
        it "shipping_burden_idが0では登録できない" do
          @item.shipping_burden_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping burden Select")
        end
        it "prefecture_idが0では登録できない" do
          @item.prefecture_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture Select")
        end
        it "handling_time_idが0では登録できない" do
          @item.handling_time_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("Handling time Select")
        end
        it "priceが空では登録できない" do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it "priceは半角数字でなければ登録できない" do
          @item.price = "aaaa"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it "priceが299円以下では登録できない" do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than 299")
        end
        it "priceが10000000円以上では登録できない" do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than 10000000")
        end
      end
    end
end
