require 'rails_helper'

describe CalculatorController do
it "should accept the command from the view" do
  put :update , :command => "add 5"
  expect(response.status).to eq(200)
  #expect(response.body).to eq("add 5")
  end
end