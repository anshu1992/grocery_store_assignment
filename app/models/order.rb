class Order < ApplicationRecord
  belongs_to :user

  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items

  enum status: [:pending, :cancelled, :paid]

  before_save :set_subtotal

  def subtotal
    line_items.map(&:subtotal).sum
  end

  def quantity_of_line_items
    # includes new line item too and so we need to use compact before calling sum

    line_items.map(&:quantity).compact.sum
  end

  private

  def set_subtotal
    self.subtotal = subtotal
  end
end
