class Product < ApplicationRecord
  belongs_to :category
  has_many_attached :images

  validates_presence_of :title, :description, :price
end
