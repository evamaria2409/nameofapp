require 'rails_helper'

describe UsersController, type: :controller do
    
    before do
    	@user1 = FactoryGirl.create(:user)
    	@user2 = FactoryGirl.create(:user)
  	end

  describe 'GET #show' do

     context 'User is logged in' do
     	
     	before do
      		sign_in @user1
    	end

    	it "loads correct user details" do
    		get :show, params: { id: @user1.id }
    		expect(response).to have_http_status(200)
    		expect(assigns(:user)).to eq @user1
    	end

    	it 'other users profile restricted' do
	        get :show, params: { id: @user2.id }
	        expect { raise "You are not authorized to access this page." }.to raise_error(RuntimeError)
      	end

     end

     context 'when a user is not logged in' do

       it 'redirects to login' do
         get :show, params: { id: @user1.id }
         expect(response).to redirect_to(new_user_session_path)
       end

     end

  end

end