class Admin::DashboardController < Admin::ApplicationController
  def show
    @products = Product.all
    @categories = Category.all
  end

end
