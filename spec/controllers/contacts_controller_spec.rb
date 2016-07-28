require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  describe 'GET #new' do
    
    before {
      get :new
    }

    it { should respond_with(200) }

    it { should route(:get, '/contacts').to(action: :index) }
    
    it { should render_template('new') }
  end
end