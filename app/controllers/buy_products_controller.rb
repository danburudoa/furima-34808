class BuyProductsController < ApplicationController
    before_action :authenticate_user!,only:[:index]
    before_action :set_product, only: [:index]
    before_action :move_to_index, only: [:index]

    def index
        #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
        @buy_product_ship = BuyProductShip.new
        
    end

    def create
        @buy_product_ship = BuyProductShip.new(buy_product_params)
        @product = Product.find(params[:product_id])
       
        if @buy_product_ship.valid?
           Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
           Payjp::Charge.create(
        amount: @product.price,  # 商品の値段
        card: buy_product_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
           @buy_product_ship.save
           redirect_to root_path
        else
          render :index
        end
    end

    private

    def buy_product_params
        params.require(:buy_product_ship).permit(:postal_code,:area_id,:municipalities,:address,:building,:phone_number).merge(user_id: current_user.id,product_id: params[:product_id],token: params[:token])
    end
    
    def set_product
        @product = Product.find(params[:product_id])
    end

    def move_to_index
        if @product.user_id == current_user.id || @product.buy_product != nil #売却済みであれば
          redirect_to root_path
        end
    end


end
