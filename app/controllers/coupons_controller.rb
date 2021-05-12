class CouponsController < ApplicationController
  before_action :set_line_item

  def apply_coupon
    @applied_coupon = Coupon.find_by(product_id: params[:product_id], code: params[:code])
    @line_item.update(coupon_id: @applied_coupon.id)

    @line_items = current_order.line_items
  end

  def remove_coupon
    @line_item.update(coupon_id: nil)

    @line_items = current_order.line_items
  end

  private

  def set_line_item
    @line_item = LineItem.find(params[:line_item_id])
  end
end
