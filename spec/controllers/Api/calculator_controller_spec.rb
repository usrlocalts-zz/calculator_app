require 'rails_helper'

describe Api::CalculatorController do
  it 'result as JSON object for "add 5"' do
    Calculator.create({:state=>0})
    put :update , :command => "add 5"
    expect(response.status).to eq(200)
    expect(response.body).to eq({:state => 5.0}.to_json)
  end

  it "should indicate calculator not created yet" do
    put :update , :command => "add 5"
    expect(response.status).to eq(404)
  end

  it "should create" do
    post :create
    expect(response.status).to eq(200)
    expect(Calculator.count).to eq(1)
  end
end