class Coupon < ApplicationRecord
  belongs_to :product

  validates_presence_of :code, :percentage_off
  validates_numericality_of :percentage_off, greater_than: 0, less_than_or_equal_to: 100
  validates :code, uniqueness: { scope: :product_id }
end
