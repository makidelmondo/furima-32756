class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index

  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:title, :explanation, :category_id, :product_status_id, :shipping_fee_id, :state_id, :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end
end
