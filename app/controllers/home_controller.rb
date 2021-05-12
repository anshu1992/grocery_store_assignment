class HomeController < ApplicationController
  def index
    @products = filtered_products
  end

  private

  def filtered_products
    params[:query].present? ? Product.all.search(params[:query]) : Product.all
  end
end
