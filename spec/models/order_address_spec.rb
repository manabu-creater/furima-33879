require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end
  describe '商品購入機能' do
    context '商品購入できること' do
      it '出品者以外のログインユーザーが、必要な情報を適切に入力すると購入できる' do
        expect(@order_address).to be_valid
      end

      it '建物名が抜けていても登録できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '商品購入ができないこと' do
      it 'zip_codeが空だと登録できない' do
        @order_address.zip_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Zip code can't be blank"
      end

      it 'delivery_area_idが空だと登録できない' do
        @order_address.delivery_area_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Delivery area can't be blank"
      end

      it 'delivery_area_idが1以外じゃないと登録できない' do
        @order_address.delivery_area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Delivery area must be other than 1"
      end

      it 'cityが空だと登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City can't be blank"
      end

      it 'addressが空だと登録できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Address can't be blank"
      end

      it 'phoneが空だと登録ができない' do
        @order_address.phone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone can't be blank"
      end

      it 'zip_codeはハイフンがないと登録できない' do
        @order_address.zip_code = '1_234_567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Zip code is invalid'
      end

      it 'phoneは11桁以内でないと登録できない' do
        @order_address.phone = '111_111_111_111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone is invalid'
      end

      it 'phoneは数値のみでないと登録できない' do
        @order_address.phone = '0901234567a'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone is invalid'
      end

      it 'tokenが空では登録ができない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'item_idがないと登録できない' do
        user = FactoryBot.create(:user)
        @order_address = FactoryBot.build(:order_address, user_id: user.id)
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'user_idがないと登録できない' do
        item = FactoryBot.create(:item)
        @order_address = FactoryBot.build(:order_address, item_id: item.id)
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
