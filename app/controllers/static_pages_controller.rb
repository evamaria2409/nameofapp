class StaticPagesController < ApplicationController
  layout "static"
  def index
  end

  def landing_page
    @featured_product = Product.first
  end

  def landing_page
  @products = Product.limit(3)
  end

  def landing_page.html.erb
  	<h2> Featured Product:</h2>
	<%= @featured_product.name %>
  end

end
