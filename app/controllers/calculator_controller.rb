#Controller for Calculator
class CalculatorController<ApplicationController
  def update
        calculator = find_or_create_with_default
        parser = Parser.new
        input = params[:command]
        operation = parser.parse(input)
        operation.operate(calculator)
        @state = Calculator.last.state
    end

  def create
    @state = find_or_create_with_default.state
  end

private
  def find_or_create_with_default
    Calculator.last||Calculator.new({:state => 0})
  end

end