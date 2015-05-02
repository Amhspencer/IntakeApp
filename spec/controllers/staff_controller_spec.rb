require 'spec_helper'

describe StaffController do

  describe 'attempting to access the staff dashboard when not logged in' do

    before :each do
        get :index, {:id => 1}
    end
      
    it 'should redirect to the login page' do
        response.should be_redirect
        response.should redirect_to('/login')
    end

  end
end
