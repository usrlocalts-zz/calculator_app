#Performs Calculator Operations
class Api::CalculatorController < ActionController::Base
  def create
    Calculator.last||Calculator.new({:state => 0})
    head :ok
  end

  def update
    input = params[:command]
    if(Calculator.last.nil?)
      head 404
    else
      calculator = Calculator.last
      parser = Parser.new
      operation = parser.parse(input)
      operation.operate(calculator)
      render :json => {:state => Calculator.last.state}
    end
  end

end