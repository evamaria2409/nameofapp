require 'rails_helper'

	describe Product do

		context "when the product has comments" do

			let(:product) { Product.create!(name: "Self Tanning Lotion") }
			let(:user) { User.create!(name: "Eva") }

			before do
		  		product.comments.create!(rating: 1, user: Eva, body: "Awful lotion!")
		  		product.comments.create!(rating: 3, user: Eva, body: "Ok lotion!")
		  		product.comments.create!(rating: 5, user: Eva, body: "Great tanning product! Absolutely loving it!")
			end

			it "returns the average rating of all comments" do
				expect(product.average_rating). to eq "3"
			end
		end

		context "A product without a description" do
			let(:product) {Product.new(description: "Dark Tanning Lotion") }

			it "is not valid without a name" do
				expect(Product.new(description: "Dark Tanning Lotion")).not_to be_valid
			end
		end
end
