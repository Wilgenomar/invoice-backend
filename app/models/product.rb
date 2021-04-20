class Product < ApplicationRecord

  self.table_name = 'w_products'
  validates :name, presence: true
  validates :price, presence: true
end
