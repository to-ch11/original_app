class HomeController < BaseController
  def index
    @shipping = Shipping.first
    @shipping_details = @shipping.shipping_details
  end
end
