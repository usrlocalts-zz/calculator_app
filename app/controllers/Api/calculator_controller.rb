#Performs Calculator Operations
class Api::CalculatorController<ActionController::Base
  def create
    @state = find_or_create_with_default.state
  end

  def update
    input = params[:command]
    calculator = Calculator.last
    parser = Parser.new
    operation = parser.parse(input)
    operation.operate(calculator)
    render :json => {:state => Calculator.last.state}
  end
end