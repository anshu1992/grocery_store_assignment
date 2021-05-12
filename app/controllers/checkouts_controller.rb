class CheckoutsController < ApplicationController
  def create
    current_order.paid!

    redirect_to [:confirmation, :checkouts], notice: "Your order has been placed."
  end

  def confirmation
  end
end
