class Order < ApplicationRecord
  belongs_to :user

  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items

  enum status: [:pending, :cancelled, :paid]

  before_save :set_subtotal

  def subtotal
    line_items.collect { |item| item.unit_price*item.quantity }.sum
  end

  def quantity_of_line_items
    line_items.map(&:quantity).sum
  end

  private

  def set_subtotal
    self.subtotal = subtotal
  end
end
