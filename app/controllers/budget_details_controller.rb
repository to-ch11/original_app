class BudgetDetailsController < BaseController
  before_action :set_budget_detail, only: [:edit, :update, :destroy]
  
  def index
    @budget_details = BudgetsDetail.all
  end
  
  def new
    @budget_detail = BudgetsDetail.new
  end
  
  def edit
  end

  def create
    @budget_detail = BudgetsDetail.new(shipping_detail_params)
    if @budget_detail.save
      redirect_to budget_details_path, notice:"出荷明細登録が出来ました！！"
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def update
    if @budget_detail.update(budget_detail_params)
      redirect_to budget_detail_path, notice: "出荷明細が更新できました！！"
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @budget_detail.destroy
    redirect_to budget_details_url, notice: "出荷明細が削除できました！！"
  end
  
  private
  
  def set_budget_detail
    @budget_detail = BudgetsDetail.find(params[:id])
  end
  
  def budget_detail_params
    params.require(:budget_detail).permit(:budget_id, :year_month, :quantity)
  end 
end
