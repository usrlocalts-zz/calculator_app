#Defines operations and performs delegation
class Operations
  attr_reader :operator,:operand
  def initialize operation,operand=0
    @operator = operation
    @operand = operand
  end
  def operate calculator
    case @operator
      when 'add'
        calculator+(@operand)
      when 'sub'
        calculator-(@operand)
      when 'multiply'
        calculator*(@operand)
      when 'divide'
        calculator/(@operand)
      when 'sqr'
        calculator.sqr
      when 'sqrt'
        calculator.sqrt
      when 'cube'
        calculator.cube
      when 'cubert'
        calculator.cubert
      when 'abs'
        calculator.abs
      when 'cancel'
         calculator.cancel
      when 'neg'
        calculator.neg
    end
  end
  def ==(other)
      return true if self.equal?(other)
      return false if other.nil?
      return false if other.class != self.class
      @operator == other.operator && @operand == other.operand
  end

  def hash
      37*(@operator.hash)
  end

  def eql? other
    self == other
  end
end