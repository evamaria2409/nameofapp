class Product < ApplicationRecord
    validates :name, presence: true
    has_many :orders
    has_many :comments

  def self.search(search_term)
    Product.where("name LIKE ?", "%#{search_term}%")
  end

  def highest_rating_comment
  	comments.rating_desc.first
    self.per_page = 10
  end

  def average_rating
  	comments.average(:rating).to_f
  end
  
end