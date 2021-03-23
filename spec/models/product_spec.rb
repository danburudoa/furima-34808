require 'rails_helper'

RSpec.describe Product, type: :model do
    before do
        @product = FactoryBot.build(:product)
        @product.image = fixture_file_upload('app/assets/images/flag.png')
    end
    
    context "商品出品できるとき" do
        it "全ての項目が存在しているとき" do
            expect(@product).to be_valid
        end

        it "priceが300円なら実行できる" do
            @product.price = 300
            expect(@product).to be_valid
        end

        it "priceが9,999,999円なら実行できる" do
            @product.price = 9999999
            expect(@product).to be_valid
        end
        
        it "priceは半角数字なら実行できる" do
            @product.price = 300
            expect(@product).to be_valid
        end
    end

    context "商品出品できないとき" do
        it 'imageがないと出品できない' do
            @product.image = nil
            @product.valid?
            expect(@product.errors.full_messages).to include("Image can't be blank")
        end

        it 'nameがないと出品できない' do
            @product.name = ""
            @product.valid?
            expect(@product.errors.full_messages).to include("Name can't be blank")
        end

        it 'category_idがないと出品できない' do
            @product.category_id = ""
            @product.valid?
            expect(@product.errors.full_messages).to include("Category is not a number")
        end

        it 'condition_idがないと出品できない' do
            @product.condition_id = ""
            @product.valid?
            expect(@product.errors.full_messages).to include("Condition is not a number")
        end

        it 'charge_idがないと出品できない' do
            @product.charge_id = ""
            @product.valid?
            expect(@product.errors.full_messages).to include("Charge is not a number")
        end

        it 'delivery_idがないと出品できない' do
            @product.delivery_id = ""
            @product.valid?
            expect(@product.errors.full_messages).to include("Delivery is not a number")
        end

        it 'area_idがないと出品できない' do
            @product.area_id = ""
            @product.valid?
            expect(@product.errors.full_messages).to include("Area is not a number")
        end

        it 'priceがないと出品できない' do
            @product.price = ""
            @product.valid?
            expect(@product.errors.full_messages).to include("Price is not a number")
        end

        it 'priceが300円以上でなければ出品できない' do
            @product.price = 299
            @product.valid?
            expect(@product.errors.full_messages).to include("Price is not included in the list")
        end
        
        it 'priceが10000000円以上でなければ出品できない' do
            @product.price = 10000000
            @product.valid?
            expect(@product.errors.full_messages).to include("Price is not included in the list")
        end
        
        it 'priceが半角数字でなければ出品できない' do
            @product.price = "３００"
            @product.valid?
            expect(@product.errors.full_messages).to include("Price is not included in the list")
        end

        it 'priceが半角英数混合では出品できない' do
            @product.price = "300dollers"
            @product.valid?
            expect(@product.errors.full_messages).to include("Price is not a number")
        end

        it 'priceが半角英語だけでは出品できない' do
            @product.price = "dollers"
            @product.valid?
            expect(@product.errors.full_messages).to include("Price is not a number")
        end

        it 'categoryのid:1が指定されていると出品できない' do
            @product.category_id = 1
            @product.valid?
            expect(@product.errors.full_messages).to include("Category must be other than 1")
        end

        it 'chargeのid:1が指定されていると出品できない' do
            @product.charge_id = 1
            @product.valid?
            expect(@product.errors.full_messages).to include("Charge must be other than 1")
        end

        it 'areaのid:1が指定されていると出品できない' do
            @product.area_id = 1
            @product.valid?
            expect(@product.errors.full_messages).to include("Area must be other than 1")
        end

        it 'conditionのid:1が指定されていると出品できない' do
            @product.condition_id = 1
            @product.valid?
            expect(@product.errors.full_messages).to include("Condition must be other than 1")
        end

        it 'deliveryのid:1が指定されていると出品できない' do
            @product.delivery_id = 1
            @product.valid?
            expect(@product.errors.full_messages).to include("Delivery must be other than 1")
        end
    end

end
