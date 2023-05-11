require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できる場合' do
      it 'imagrとname、explanationとcategory_id、condition_id、charge_id、region_id、period_id、priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できない場合' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category_id can't be blank")
      end
      it 'category_idが---では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category_id can't be blank")
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition_id can't be blank")
      end
      it 'condition_idが---では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition_id can't be blank")
      end
      it 'charge_idが空では登録できない' do
        @item.charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge_id can't be blank")
      end
      it 'charge_idが---では登録できない' do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge_id can't be blank")
      end
      it 'region_idが空では登録できない' do
        @item.region_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Region_id can't be blank")
      end
      it 'region_idが---では登録できない' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Region_id can't be blank")
      end
      it 'period_idが空では登録できない' do
        @item.period_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Period_id can't be blank")
      end
      it 'period_idが---では登録できない' do
        @item.period_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Period_id can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが299円以下だと出品できない" do
        @item.price = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが10000000円以上だと出品できない" do
        @item.price = 10000001
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'priceが全角だと登録できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 価格は半角で入力してください")
    end
      it 'ユーザーが紐付いていなければ投稿できない' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
