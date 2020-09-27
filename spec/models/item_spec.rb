require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品商品の保存' do
    context "出品商品が保存できる場合" do
      it "画像・商品名・商品の説明・カテゴリー・状態・配送料の負担・発送元の地域・発送までの日数・販売価格があれば出品商品は保存される" do
        expect(@item).to be_valid
      end
    end
    context "出品商品が保存できない場合" do
      it "画像が空では保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が空では保存できない" do
        @item.products_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Products name can't be blank")
      end
      it "商品の説明が空では保存できない" do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "商品のカテゴリーを選択していなければ保存できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it "商品の状態を選択していなければ保存できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status Select")
      end
      it "配送料の負担を選択していなければ保存できない" do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee Select")
      end
      it "発送元の地域を選択していなければ保存できない" do
        @item.shipping_place_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping place Select")
      end
      it "発送までの日数を選択していなければ保存できない" do
        @item.day_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day to ship Select")
      end
      it "販売価格が空では保存できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "販売価格が9,999,999円を超えては保存できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
    end
  end
end
