class LineItemsController < ApplicationController
  before_action :set_product, only: :create

  def create
    # Increase quantity of line item if product already is in order

    line_items = current_order.line_items.where(product_id: line_item_params[:product_id])

    if line_items.any?
      @line_item = line_items.first
      @line_item.quantity = @line_item.quantity + line_item_params[:quantity].to_i
    else
      @line_item = current_order.line_items.new(line_item_params)
    end

    @line_item.save
    current_order.save
  end

  def update
    @line_item = current_order.line_items.find(params[:id])
    @line_item.update(line_item_params)
    @line_items = current_order.line_items
  end

  def destroy
    @line_item = current_order.line_items.find(params[:id])
    @line_item.destroy
    @line_items = current_order.line_items
  end

  private

  def line_item_params
    params.require(:line_item).permit(:product_id, :quantity, :unit_price)
  end

  def set_product
    @product = Product.find(line_item_params[:product_id])
  end
end
