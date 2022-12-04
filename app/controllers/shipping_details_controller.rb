class ShippingDetailsController < BaseController
    before_action :set_shipping_detail, only: [:edit, :update, :destroy]

  def index
    @shipping_details = @shipping.shipping_details
  end
  
  def new
    @shipping_detail = ShippingDetail.new
  end
  
  def edit
  end

  def create
    @shipping_detail = ShippingDetail.new(shipping_detail_params)
    if @shipping_detail.save
      redirect_to shipping_details_path, notice:"出荷明細登録が出来ました！！"
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def update
    if @shipping_detail.update(shipping_detail_params)
      redirect_to shipping_detail_path, notice: "出荷明細が更新できました！！"
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @shipping_detail.destroy
    redirect_to shipping_details_url, notice: "出荷明細が削除できました！！"
  end
  
  private
  
  def set_shipping
    @shipping = Shipping.find(params[:shipping_id])
  end
  
  def set_shipping_detail
    @shipping_detail = ShippingDetail.find(params[:shipping_detail_id])
  end
  
  def shipping_detail_params
    params.require(:shipping_detail).permit(:shipping_id, :year_month, :quantity)
  end 

end