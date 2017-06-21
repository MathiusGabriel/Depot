require 'rails_helper'

describe AdminController do
  before(:all) do
    user = create(:user, name: "Tom")
    order = create(:order)
  end

  describe "Admin login" do
    context "User not recognized" do
      it "should redirect to login" do
        get 'index'
        expect(response.status).to redirect_to login_url
        expect(flash[:notice]).to eq "Please log in"
      end
    end
   context "User recognized" do
     before do

     end
     it "should get admin view" do
        #puts "#{User.all.pluck(:name)}"
        get 'index'
        expect(response.status).to be_success
      end
    end
  end
end
