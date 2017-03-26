class StaticPagesController < ApplicationController
  layout "static"
  def index
  end

  def landing_page
    @featured_product = Product.first
    @products = Product.limit(3)
  end


end
