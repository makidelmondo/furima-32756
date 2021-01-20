class DealRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:index, :new, :create]
  before_action :move_to_index
  def index
    @deal_record = DealRecord.new
  end

  def create
    @deal_record = DealShipment.new(deal_params)
    if @deal_record.valid?
      card_payment
      @deal_record.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
#プライベートメソッド内に書かれたメソッドの順序は実行順序に関係ない。ビフォーアクションに書いた順に実行されることに留意すること。
  def deal_params
    params.require(:deal_record).permit(:zip_code, :state_id, :city, :street, :apartment, :telephone).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def card_payment
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
          amount: @product.price,
          card: deal_params[:token],
          currency: 'jpy'
    )
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
  
  def move_to_index
    if current_user.id == @product.user_id || @product.deal_record.present?
      redirect_to root_path
    end
  end
end
