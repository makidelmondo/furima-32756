class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:edit, :update, :destroy, :show]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  def index
    @products = Product.order(id: "DESC")
    #DESCと追記する事でIDの降順で並べ替えている。
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

  def destroy
    @product.destroy
    redirect_to root_path
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
    #以下の記述だと一見して有効に見えるが、||ではなく&&にしないと無効であると後に分かった。&&だと有効でも人間の言語として難解なので57行目とした。Unlessでそもそも演算子の長文を作るのは一般的ではないそうだ。
    #redirect_to root_path unless current_user == @product.user || @product.deal_record == nil
    redirect_to root_path if current_user != @product.user || @product.deal_record != nil
  end
end
