require 'rails_helper'

describe CalculatorController do
it "should render update" do
  put :update , :command => "add 5"
  expect(response.status).to eq(200)
  expect(response).to render_template("update")
  expect(assigns[:state]).to eq(5.0)
end

it "should render create" do
  put :create
  expect(response.status).to eq(200)
  expect(response).to render_template("create")
end
end