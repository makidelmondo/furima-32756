class DealRecordsController < ApplicationController
  before_action :set_product, only: [:index, :new, :create]
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
end
