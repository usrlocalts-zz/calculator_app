#parses the given string and returns an operation
class Parser
  def parse input
    input = input.split
    @operator,@operand = input[0], input[1].to_f
    Operations.new(@operator,@operand)
  end
end