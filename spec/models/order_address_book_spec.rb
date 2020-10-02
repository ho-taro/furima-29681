require 'rails_helper'

RSpec.describe OrderAddressBook, type: :model do
  describe '決済情報と配送先情報の保存' do
    before do
      @order_address_book = FactoryBot.build(:order_address_book)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address_book).to be_valid
    end
    it 'postcodeが空だと保存できないこと' do
      @order_address_book.postcode = nil
      @order_address_book.valid?
      expect(@order_address_book.errors.full_messages).to include("Postcode can't be blank")
    end
    it 'postcodeにハイフンがないと保存できないこと' do
      @order_address_book.postcode = '1112222'
      @order_address_book.valid?
      expect(@order_address_book.errors.full_messages).to include('Postcode Input correctly')
    end
    it 'prefecture_idだ空だと保存できないこと' do
      @order_address_book.prefecture_id = nil
      @order_address_book.valid?
      expect(@order_address_book.errors.full_messages).to include('Prefecture Select')
    end
    it 'prefecture_idが0以下だと保存できないこと' do
      @order_address_book.prefecture_id = '0'
      @order_address_book.valid?
      expect(@order_address_book.errors.full_messages).to include('Prefecture Select')
    end
    it 'cityが空だと保存できないこと' do
      @order_address_book.city = nil
      @order_address_book.valid?
      expect(@order_address_book.errors.full_messages).to include("City can't be blank")
    end
    it 'blockが空だと保存できないこと' do
      @order_address_book.block = nil
      @order_address_book.valid?
      expect(@order_address_book.errors.full_messages).to include("Block can't be blank")
    end
    it 'mobileが空だと保存できないこと' do
      @order_address_book.mobile = nil
      @order_address_book.valid?
      expect(@order_address_book.errors.full_messages).to include("Mobile can't be blank", 'Mobile is invalid')
    end
    it 'user_idが空だと保存できないこと' do
      @order_address_book.user_id = nil
      @order_address_book.valid?
      expect(@order_address_book.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空だと保存できないこと' do
      @order_address_book.item_id = nil
      @order_address_book.valid?
      expect(@order_address_book.errors.full_messages).to include("Item can't be blank")
    end
    it 'tokenが空だと保存できないこと' do
      @order_address_book.token = nil
      @order_address_book.valid?
      expect(@order_address_book.errors.full_messages).to include("Token can't be blank")
    end
  end
end
