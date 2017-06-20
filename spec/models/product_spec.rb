require 'rails_helper'

	describe Product do

		context "when the product has comments" do

			let(:product) { Product.create(name: "Self Tanning Lotion") }
			let(:user) { User.create(first_name: "Eva", last_name: "Rietschel", email: "user@example.co.uk", password: "test1234") }

			before do
		  		product.comments.create!(rating: 1, user: user, body: "Awful lotion!")
		  		product.comments.create!(rating: 3, user: user, body: "Ok lotion!")
		  		product.comments.create!(rating: 5, user: user, body: "Great tanning product! Absolutely loving it!")
			end

			it "returns the average rating of all comments" do
				expect(product.average_rating). to eq 3
			end
		end

		context "A product without a description" do
			let(:product) {Product.new(description: "Dark Tanning Lotion") }

			it "is not valid without a name" do
				expect(Product.new(description: "Dark Tanning Lotion")).not_to be_valid
			end
		end
end
