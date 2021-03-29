require 'rails_helper'

RSpec.describe BuyProductShip, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.build(:product)
    @product.image = fixture_file_upload('app/assets/images/flag.png')
    @product.save
    sleep 1 #処理を遅らせる
    @buy_product_ship = FactoryBot.build(:buy_product_ship, user_id: @user.id , product_id: @product.id) 
   end

  describe '購入内容確認' do
    context '商品購入がうまくいく時' do
      it '全ての値が正しく入力されていれば購入できること' do
        expect(@buy_product_ship).to be_valid
      end

      it 'buildingが空でも購入できる' do
        @buy_product_ship.building = ''
        expect(@buy_product_ship).to be_valid
      end
    end

    context '商品購入がうまくいかない時' do
      it 'postal_codeが空だと登録できない' do
        @buy_product_ship.postal_code = ''
        @buy_product_ship.valid?
        expect(@buy_product_ship.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'area_idが空だと登録できない' do
        @buy_product_ship.area_id = ''
        @buy_product_ship.valid?
        expect(@buy_product_ship.errors.full_messages).to include("Area Select")
      end
      
      it 'municipalitiesが空だと登録できない' do
        @buy_product_ship.municipalities = ''
        @buy_product_ship.valid?
        expect(@buy_product_ship.errors.full_messages).to include("Municipalities can't be blank")
      end

      it 'addressが空だと登録できない' do
        @buy_product_ship.address  = ''
        @buy_product_ship.valid?
        expect(@buy_product_ship.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空だと登録できない' do
        @buy_product_ship.phone_number = ''
        @buy_product_ship.valid?
        expect(@buy_product_ship.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'tokenが空だと登録できない' do
        @buy_product_ship.token = ''
        @buy_product_ship.valid?
        expect(@buy_product_ship.errors.full_messages).to include("Token can't be blank")
      end
      
      it 'post_codeにハイフンがないと登録できない' do
        @buy_product_ship.postal_code = '123456'
        @buy_product_ship.valid?
        expect(@buy_product_ship.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'phone_numberにハイフンがないと登録できない' do
        @buy_product_ship.phone_number = '0808221711'
        @buy_product_ship.valid?
        expect(@buy_product_ship.errors.full_messages).to include("Phone number Input only number")
      end

      it 'user_idが空だと登録できない' do
        @buy_product_ship.user_id = ''
        @buy_product_ship.valid?
        expect(@buy_product_ship.errors.full_messages).to include("User can't be blank")
      end

      it 'product_idが空だと登録できない' do
        @buy_product_ship.product_id = ''
        @buy_product_ship.valid?
        expect(@buy_product_ship.errors.full_messages).to include("Product can't be blank")
      end

      it 'area_idで1が選択されると登録できない' do
        @buy_product_ship.area_id = 1
        @buy_product_ship.valid?
        expect(@buy_product_ship.errors.full_messages).to include("Area Select")
      end

      end
    end 
end
