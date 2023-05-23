require 'rails_helper'

RSpec.describe OrderPurchase, type: :model do
  describe 'クレジットカード情報の保存' do
    before do
      user = FactoryBot.create(:user, :item)
      @order_purchase = FactoryBot.build(:order_purchase, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_purchase).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_purchase.building_name = ''
        expect(@order_purchase).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postcodeが空だと保存できないこと' do
        @order_purchase.postcode = ''
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_purchase.postcode = '1234567'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it 'region_idが空だと保存できないこと' do
        @order_purchase.region_id = ''
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Region_id can't be blank")
      end
      it 'region_idが---では登録できない' do
        @order_purchase.region_id = 1
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Region_id can't be blank")
      end
      it 'municipalitiesが空だと保存できないこと' do
        @order_purchase.municipalities = ''
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order_purchase.address = ''
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephoneが空だと保存できないこと' do
        @order_purchase.telephone = ''
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneが9文字以下では登録できない' do
        @order_purchase.telephone = '090123456'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Telephone is too short (minimum is 10 characters)')
      end
      it 'telephoneが12文字以上では登録できない' do
        @order_purchase.telephone = '090123456789'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Telephone is too long (maximum is 11 characters)')
      end
      it 'telephoneが半角数字でないと出品できない' do
        @order_purchase.telephone = '０９０１２３４５６７８'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Telephone is not included in the list')
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_purchase.user_id = nil
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Userを入力してください")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_purchase.item_id = nil
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("User can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
