class PaymentsController < ApplicationController
	
	def create

    	@product = Product.find(params[:product_id])
    	if user_signed_in?
      		@user = current_user
    	else
      		@user = User.new(id: 99)
    	end
    
    	token = params[:stripeToken]
    	begin
      		charge = Stripe::Charge.create(
		        amount: (@product.price * 100).to_i,
		        currency: "eur",
		        source: token,
		        description: @product.description,
		        receipt_email: params[:stripeEmail]
		    )

		    if charge.paid
		       Order.create(
		        user_id: @user.id,
		        product_id: params[:product_id],
		        total: @product.price
		       )
		       flash[:notice] = "Thank you for purchasing #{@product.name}"
		    end

    rescue Stripe::CardError => e
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end
    redirect_to product_path(@product)
  end

end
