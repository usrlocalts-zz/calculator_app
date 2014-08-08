require 'rails_helper'
include Devise::TestHelpers
describe CalculatorController do
it "should render update" do
  user =User.create(:email=>"hemalijains@gmail.com",:encrypted_password=>"hemali")
  sign_in :user, user
  allow(user).to receive(:calculator){Calculator.create(:state=>0,:user_id=>user)}
  allow(@controller).to receive(:current_user){user}
  put :update , :command => "add 5"
  expect(response.status).to eq(200)
  expect(response).to render_template("update")
  expect(assigns[:state]).to eq(5.0)
end

it "should render create" do
  user =User.create(:email=>"hemalijains@gmail.com",:encrypted_password=>"hemali")
  sign_in :user, user
  allow(@controller).to receive(:current_user){user}
  put :create
  expect(response.status).to eq(200)
  expect(response).to render_template("create")
end
end