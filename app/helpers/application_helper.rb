module ApplicationHelper
  def current_order
    @order = current_user.orders.last

    if @order.nil? || !@order.pending?
      @order = current_user.orders.new
    end

    @order
  end

  def get_new_line_item
    @new_line_item = current_order.line_items.new
  end
end
