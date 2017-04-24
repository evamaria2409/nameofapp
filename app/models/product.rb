class Product < ApplicationRecord
	has_many :orders
end

def self.search(search_term)
  Product.where("name LIKE ?", "%#{search_term}%")
end