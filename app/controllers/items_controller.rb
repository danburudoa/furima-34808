class ItemsController < ApplicationController
    before_action :authenticate_user!,only:[:new]

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

    private

    def product_params
        params.require(:product).permit(:name,:describe,:category_id,:condition_id,:charge_id,:delivery_id,:area_id,:price,:image).merge(user_id: current_user.id)
    end
end
