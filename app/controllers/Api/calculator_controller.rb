#Performs Calculator Operations
class Api::CalculatorController < ApiController
  def create
     unless current_user.calculator
      current_user.calculator=Calculator.create({:state => 0, :user => current_user})
      head 201
     else
       head: ok
     end
  end

    def update
      input = params[:command]
      if (current_user.calculator.nil?)
        head 404
      else
        calculator = current_user.calculator
        parser = Parser.new
        operation = parser.parse(input)
        operation.operate(calculator)
        render :json => {:state => calculator.state}
      end
    end
  end