require 'rails_helper'

RSpec.describe OrderAddress, type: :model do

  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '購入情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefectureが1では保存できないこと' do
        @order_address.prefecture = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁以下だと保存できないこと' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid.")
      end
      it 'phone_numberが12桁以上だと保存できないこと' do
        @order_address.phone_number = '000123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid.")
      end
      it 'phone_numberが数字のみでないと保存できないこと' do
        @order_address.phone_number = 'aa12345678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid.")
      end
      it 'tokenが空だと保存できないこと' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐づいていないと保存できないこと' do
        @order_address.user = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User must exist")
      end
      it 'itemが紐づいていないと保存できないこと' do
        @order_address.item = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item must exist")
      end
    end
  end
end

