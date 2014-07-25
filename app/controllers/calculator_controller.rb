#Controller for Calculator
class CalculatorController<ActionController::Base
  def update
    calculator = Calculator.new({:state => 0})
    parser = Parser.new
    input = params[:command]
    operation = parser.parse(input)
    operation.operate(calculator)
    render text:calculator.state
  end
end