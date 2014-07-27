require 'rails_helper'

describe 'Api::CalculatorController' do
  it 'result as JSON object for "add 5"' do
    put :update , :command => "add 5"
    expect(response.status).to eq(200)
    expect(response.body).to eq({:state => 5}.to_json)

  end

  it "should create" do
    put :create
    expect(response.status).to eq(200)

  end
end