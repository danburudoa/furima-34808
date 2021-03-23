class ItemsController < ApplicationController
    before_action :authenticate_user!,only:[:new,:create,:edit,:update]
    before_action :move_to_index, only: [:edit]

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
      @product = Product.find(params[:id])
    end

    def edit
      @product = Product.find(params[:id])
      unless @product.user_id == current_user.id
        redirect_to action: :index
      end
    end

    def update
      @product = Product.find(params[:id])
      @product.update(product_params)
      if @product.save
        redirect_to item_path(@product.id)
      else
        render :edit
      end
    end

    private

    def product_params
        params.require(:product).permit(:name,:describe,:category_id,:condition_id,:charge_id,:delivery_id,:area_id,:price,:image).merge(user_id: current_user.id)
    end

    def move_to_index
      unless user_signed_in? 
        redirect_to action: :index
      end
    end
end

