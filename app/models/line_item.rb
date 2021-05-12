class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :order
  belongs_to :coupon, optional: true

  before_save :set_subtotal

  delegate :title, :description, :price, :category_title, to: :product, prefix: :product

  def subtotal
    final_amount = unit_price*quantity

    if coupon.present?
      discount = final_amount * coupon.percentage_off.round(2) / 100
      final_amount = final_amount - discount
    end

    final_amount.round(2)
  end

  private

  def set_subtotal
    self.subtotal = subtotal
  end
end
