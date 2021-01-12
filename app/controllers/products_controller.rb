class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show,]
  before_action :set_product, only: [:edit, :update, :show]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  def index
    @products = Product.order(id: "DESC")
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

  def edit
    
  end

  def update
    @product.update(product_params)
    if @product.save
      redirect_to product_path, method: :get
    else
      render :edit
    end
  end

  def show
    
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :explanation, :category_id, :product_status_id, :shipping_fee_id, :state_id, :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless current_user == @product.user
  end
end
