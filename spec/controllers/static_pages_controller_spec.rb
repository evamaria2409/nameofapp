require 'rails_helper'

describe StaticPagesController, type: :controller do
  context 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  context 'GET #about' do
    before do
      get :about
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    
    it 'renders about template' do
      expect(response).to render_template('about')
    end
  end
  
end