require 'rails_helper'

describe UsersController, type: :controller do
    
    before do
    	@user1 = FactoryGirl.create(:user)
    	@user2 = User.create!(first_name: "Eva", last_name: "Rietschel", email: "eva.maria@voguemail.com", password: "123456789", admin: false)
  	end

  describe 'GET #show' do

     context 'when a user is logged in' do
     	
     	before do
      		sign_in @user1
    	end

    	it "loads correct user details" do
    		get :show, params: { id: @user1.id }
    		expect(response).to be_ok
    		expect(assigns(:user)).to eq @user1
    	end

    	it 'other users profile restricted' do
	        get :show, params: { id: @user2.id }
	        expect(response).to redirect_to(root_path)
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