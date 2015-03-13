require 'spec_helper'

describe StaticPagesController do

  describe "GET 'disclaimer'" do
    it "returns http success" do
      get 'disclaimer'
      response.should be_success
    end
  end

  describe "GET 'confirmation'" do
    it "returns http success" do
      get 'confirmation'
      response.should be_success
    end
  end

end
