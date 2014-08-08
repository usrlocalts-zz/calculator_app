require 'rails_helper'
require 'devise'
include Devise::TestHelpers
describe Api::CalculatorController do
  it 'result as JSON object for "add 5"' do
    user =User.create(:email => "hemalijains@gmail.com", :password => "hemaliheamli")
    sign_in :user, user
    allow(user).to receive(:calculator) { Calculator.create(:state => 0, :user_id => user) }
    allow(controller).to receive(:current_user) { user }
    put :update, :command => "add 5"
    expect(response.status).to eq(200)
    expect(response.body).to eq({:state => 5.0}.to_json)
  end


  it "should indicate calculator not created yet" do
    user =User.create(:email => "tshriram02@gmail.com", :password => "hemalihemali")
    sign_in :user, user
    allow(@controller).to receive(:current_user) { user }
    put :update, :command => "add 5"
    expect(response.status).to eq(404)
  end

  it "should create" do
    user =User.create(:email => "shriram@gmail.com", :password => "hemalihemali")
    sign_in :user, user
    allow(@controller).to receive(:current_user) { user }
    post :create, {:format => :json}
    expect(response.status).to eq(201)
    expect(user.calculator).to_not eq(nil)
  end
  it "should not create a calculator when the user is not logged in" do
    user = nil
    sign_in :user user
    allow(@controller).to receive(:current_user){user}
     post :create, {:format => :json}
    expect(response.status).to eq(401)
  end
end