require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  context '内容に問題ない場合' do
    it "cardnameとexpirationとsecuritycodeとtokenがあれば保存ができること" do
      expect(@order).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "cardnumberが空では保存ができないこと" do
      @order.cardnumber = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Cardnumber can't be blank")
    end

    it "expirationが空では登録できないこと" do
      @order.expiration = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Expiration can't be blank")
    end

    it "securitycodeが空では登録できないこと" do
      @order.securitycode = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Securitycode can't be blank")
    end

    it "tokenが空では登録できないこと" do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
  end
end
