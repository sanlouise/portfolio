require 'rails_helper'

RSpec.describe BlogsController, type: :controller do
  describe 'GET #index' do
    
    before {
      get :index
    }

    it { should respond_with(200) }

    it { should route(:get, '/blogs').to(action: :index) }
    
    it { should render_template('index') }
  end
end