class CouponsController < ApplicationController
  def apply_coupon
    @line_item = LineItem.find(params[:line_item_id])
    @applied_coupon = Coupon.find_by(product_id: params[:product_id], code: params[:code])
    @line_item.update(coupon_id: @applied_coupon.id)

    @line_items = current_order.line_items
  end
end
