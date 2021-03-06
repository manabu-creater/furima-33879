require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/flag.png')
  end

  describe '出品商品登録' do
    context '出品する商品が登録できるとき' do
      it '全ての項目の入力が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品する商品が登録できないとき' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end

      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it 'detailが空では登録できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Detail can't be blank"
      end

      it 'condition_idが空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end

      it 'delivery_day_idが空では登録できない' do
        @item.delivery_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery day can't be blank"
      end

      it 'delivery_area_idが空では登録できない' do
        @item.delivery_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery area can't be blank"
      end

      it 'delivery_bear_idが空では登録できない' do
        @item.delivery_bear_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery bear can't be blank"
      end

      it 'priceは半角数字でないと登録できない' do
        @item.price = '１００円'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not included in the list'
      end

      it 'priceは300円以上でないと登録できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not included in the list'
      end

      it 'priceは9,999,999円以内でないと登録できない' do
        @item.price = 10_000_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not included in the list'
      end

      it 'priceは半角英数混合では登録できない' do
        @item.price = '5 million'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not included in the list'
      end

      it 'priceは半角英語だけでは登録できない' do
        @item.price = 'five hundred'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not included in the list'
      end

      it 'condition_idが1を選択している場合は登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Condition must be other than 1'
      end

      it 'category_idが1を選択している場合は登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category must be other than 1'
      end

      it 'delivery_area_idが1を選択している場合は登録できない' do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Delivery area must be other than 1'
      end

      it 'delivery_bear_idが1を選択している場合は登録できない' do
        @item.delivery_bear_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Delivery bear must be other than 1'
      end

      it 'delivery_day_idが1を選択している場合は登録できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Delivery day must be other than 1'
      end
    end
  end
end
