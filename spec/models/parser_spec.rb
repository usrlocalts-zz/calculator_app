require 'rails_helper'

describe Parser do

  context "Parsing" do

    it 'should be add,5 for "add 5"' do
      calculator = Calculator.new({:state =>0})
      parser = Parser.new
      expect(parser.parse("add 5")).to eq(Operations.new("add",5))
    end

    it 'should be sub,5 for "sub 5"' do
      calculator = Calculator.new({:state =>0})
      parser = Parser.new
      expect(parser.parse("sub 5")).to eq(Operations.new("sub",5))
    end

    it 'should be multiply,5 for "multiply 5"' do
      calculator = Calculator.new({:state =>0})
      parser = Parser.new
      expect(parser.parse("multiply 5")).to eq(Operations.new("multiply",5))
    end

    it 'should be divide,5 for "divide 5"' do
      calculator = Calculator.new({:state =>0})
      parser = Parser.new
      expect(parser.parse("divide 5")).to eq(Operations.new("divide",5))
    end

    it 'should be sqr for "sqr"' do
      calculator = Calculator.new({:state =>0})
      parser = Parser.new
      expect(parser.parse("sqr")).to eq(Operations.new("sqr"))
    end

    it 'should be sqrt for "sqrt"' do
      calculator = Calculator.new({:state =>0})
      parser = Parser.new
      expect(parser.parse("sqrt")).to eq(Operations.new("sqrt"))
    end

    it 'should be cubert for "cubert"' do
      calculator = Calculator.new({:state =>0})
      parser = Parser.new
      expect(parser.parse("cubert")).to eq(Operations.new("cubert"))
    end

    it 'should be cube for "cube"' do
      calculator = Calculator.new({:state =>0})
      parser = Parser.new
      expect(parser.parse("cube")).to eq(Operations.new("cube"))
    end

    it 'should be neg for "neg"' do
      calculator = Calculator.new({:state =>0})
      parser = Parser.new
      expect(parser.parse("neg")).to eq(Operations.new("neg"))
    end
    it 'should be abs for "cancel"' do
      calculator = Calculator.new({:state =>0})
      parser = Parser.new
      expect(parser.parse("cancel")).to eq(Operations.new("cancel"))
    end
    it 'should be abs for "abs"' do
      calculator = Calculator.new({:state =>0})
      parser = Parser.new
      expect(parser.parse("abs")).to eq(Operations.new("abs"))
    end
   end
end