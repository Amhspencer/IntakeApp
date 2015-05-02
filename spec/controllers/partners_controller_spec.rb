require 'spec_helper'

describe PartnersController do

  describe 'attempting to access the partner dashboard when not logged in' do

    before :each do
        get :index, {:id => 3}
    end
      
    it 'should redirect to the login page' do
        response.should be_redirect
        response.should redirect_to('/login')
    end

  end
end
