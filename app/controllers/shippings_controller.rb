class ShippingsController < BaseController
  before_action :set_shipping, only: [:show, :edit, :update, :destroy]
  
  def index
    @shippings = current_user.shippings.order(created_at: :asc)
    @items = Item.order(created_at: :desc)
  end
  
  def show
    @shipping = current_user.shippings.find(params[:id])
  end
  
  def new
    @shipping = current_user.shippings.build
    @items = Item.order(created_at: :desc)
  end
  
  def edit
    @shipping = current_user.shippings.find(params[:id])
  end
  
  def create
    @shipping = current_user.shippings.build(shipping_params)
    if @shipping.save
      redirect_to shippings_path, notice:"数量登録が出来ました！！"
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def update
    if @shipping.update(shipping_params)
      redirect_to shippings_path, notice: "数量が更新できました！！"
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @shipping.destroy
    redirect_to shipping_url, notice: "数量が削除できました！！"
  end
  
  private

  def set_shipping
    @shipping = current_user.shippings.find(params[:id])
  end

  def shipping_params
    params.require(:shipping).permit(:item_id, :user_id, :budget_id, :date_on, :quantity)
  end

end
