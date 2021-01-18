class DealRecordsController < ApplicationController
  before_action :set_product, only: [:index, :new, :create]
  def index
    @deal_record = DealRecord.new
  end

  def create
    @deal_record = DealShipment.new(deal_params)
    binding.pry
    if @deal_record.valid?
      @deal_record.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def deal_params
    params.require(:deal_record).permit(:zip_code, :state_id, :city, :street, :apartment, :telephone).merge(user_id: current_user.id, product_id: params[:product_id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
