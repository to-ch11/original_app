class ItemsController < BaseController
  before_action :set_item, only: [:edit, :update, :destroy]
  
  def index
    @items = Item.order(created_at: :desc)
  end
  
  def new
    @item = Item.new
  end
  
  def edit
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path, notice:"品目登録が出来ました！！"
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def update
    if @item.update(item_params)
      redirect_to item_path, notice: "品目情報が更新できました！！"
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @item.destroy
    redirect_to items_url, notice: "数量が削除できました！！"
  end
  
  private
  
  def set_item
    @item = Item.find(params[:id])
  end
  
  def item_params
    params.require(:item).permit(:code, :name, :large_classification, :small_classification, :component_n, :component_p, :component_k, {branch_ids: [] , factory_ids: []})
  end
  
end
