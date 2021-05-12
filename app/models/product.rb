class Product < ApplicationRecord
  belongs_to :category
  has_many_attached :images

  has_many :line_items, dependent: :destroy
  has_many :orders, through: :line_items
  has_many :coupons, dependent: :destroy

  validates_presence_of :title, :description, :price

  delegate :title, to: :category, prefix: :category
end
