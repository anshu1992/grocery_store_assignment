class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  before_save :set_subtotal

  delegate :title, :description, :price, :category_title, to: :product, prefix: :product

  def subtotal
    unit_price*quantity
  end

  private

  def set_subtotal
    self.subtotal = subtotal
  end
end
