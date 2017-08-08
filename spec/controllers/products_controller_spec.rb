require 'rails_helper'

describe ProductsController, :type => :controller do
  context 'GET #index' do
    before do
      get :index
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end

  context 'POST #create' do
    it 'is an invalid product' do
    @product = FactoryGirl.build(:product, name: "")
    expect(@product).not_to be_valid
    end
  end


  context "PUT #update/:price" do
    before do
      @product = FactoryGirl.create(:product)
      @user = FactoryGirl.build(:admin)
      sign_in @user
    end

    it "successfully updates product price" do
      @attr = { :name => @product.name, :image_url => @product.image_url, :id => @product.id, :price => "25.99" }
      put :update, params: { :id => @product.id, :product => @attr }
      @product.reload
      expect(@product.price).to eq 25.99
    end
  end

  context "DELETE #destroy" do

    before do
      @product = FactoryGirl.create(:product)
      @user = FactoryGirl.build(:admin)
      sign_in @user
    end

    it "should allow admin to delete product" do
      expect(delete :destroy, params: {:id => @product} ).to redirect_to("http://test.host/login")
    end
  end

end
