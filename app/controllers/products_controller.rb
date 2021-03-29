class ProductsController < ApplicationController
    before_action :authenticate_user!,only:[:new,:create,:edit,:update]
    before_action :set_tweet, only: [:edit, :show,:update,:destroy]
    before_action :move_to_index, only: [:edit,:update,:destroy]
    
    def index
      @products = Product.includes(:user).order("created_at DESC")
    end

    def new
       @product = Product.new
    end

    def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to root_path
      else
        render :new
      end
    end

    def show
      
    end

    def edit
      
    end

    def update
      if @product.update(product_params)
           redirect_to product_path(@product.id)
      else
        render :edit
      end
    end

    def destroy
      @product.destroy
      redirect_to root_path
    end
    
    private

    def product_params
        params.require(:product).permit(:name,:describe,:category_id,:condition_id,:charge_id,:delivery_id,:area_id,:price,:image).merge(user_id: current_user.id)
    end

    def set_tweet
      @product = Product.find(params[:id])
    end

    def move_to_index
      unless @product.user_id == current_user.id || @product.buy_product == nil
        redirect_to root_path
      end
    end
end

