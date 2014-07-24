require 'rails_helper'
describe Calculator do

  context 'Saves the state' do
    context 'operations' do
      context 'Addition' do
        it 'should add 5 ' do
          calculator = Calculator.new({:state => 0})
          calculator.+5
          calculator.reload
          expect(calculator.state).to eq(5)
        end

      end

      context 'Subtraction' do
        it 'should subtract  5 ' do
          calculator = Calculator.new({:state => 0})
          calculator.-5
          calculator.reload
          expect(calculator.state).to eq(-5)
        end
      end
      context 'Multiplication' do
        it 'should subtract  5 ' do
          calculator = Calculator.new({:state => 1})
          calculator*5
          calculator.reload
          expect(calculator.state).to eq(5)
        end
      end
      context 'Division' do
        it 'should divide  5 ' do
          calculator = Calculator.new({:state => 5})
          calculator/5
          calculator.reload
          expect(calculator.state).to eq(1)
        end


      end
    end
    context "Advanced operations" do

      context "Absolute value" do
        it 'should be 2.0 for input -2.0'do
          calculator = Calculator.new({:state => -2.0})
          calculator.abs
          calculator.reload
          expect(calculator.state).to eq(2.0)
        end
      end

      context "Negation" do
        it 'should be -2.0 for input -2.0'do
          calculator = Calculator.new({:state => 2.0})
          calculator.neg
          calculator.reload
          expect(calculator.state).to eq(-2.0)
        end
      end
      context "Square Root" do
        it 'should be 2.0 for input 4.0'do
          calculator = Calculator.new({:state => 4.0})
          calculator.sqrt
          calculator.reload
          expect(calculator.state).to eq(2)
        end
      end

      context "Square" do
        it 'should be 4.0 for input 2.0'do
          calculator = Calculator.new({:state => 2.0})
          calculator.sqr
          calculator.reload
          expect(calculator.state).to eq(4.0)
        end
      end


      context "Cube" do
        it 'should be 8.0 for input 2.0'do
          calculator = Calculator.new({:state => 2.0})
          calculator.cube
          calculator.reload
          expect(calculator.state).to eq(8.0)
        end
      end

      context "Cube Root" do
        it 'should be 2.0 for input 8.0'do
          calculator = Calculator.new({:state => 8.0})
          calculator.cubert
          calculator.reload
          expect(calculator.state).to eq(2.0)
        end
      end

    end

    context "cancel" do
      it 'should reset ' do
        calculator = Calculator.new({:state => 2.0})
        calculator.cancel
        calculator.reload
        expect(calculator.state).to eq(0.0)
      end

    end
  end

  context 'operations' do
    context 'Addition' do
      it 'should add 5 ' do
        calculator = Calculator.new({:state => 0})
        calculator.+5
        expect(calculator.state).to eq(5)
      end

    end

    context 'Subtraction' do
      it 'should subtract  5 ' do
        calculator = Calculator.new({:state => 0})
        calculator.-5
        expect(calculator.state).to eq(-5)
      end
    end
    context 'Multiplication' do
      it 'should subtract  5 ' do
        calculator = Calculator.new({:state => 1})
        calculator*5
        expect(calculator.state).to eq(5)
      end
    end
    context 'Division' do
      it 'should divide  5 ' do
        calculator = Calculator.new({:state => 5})
        calculator/5
        expect(calculator.state).to eq(1)
      end


    end
  end
  context "Advanced operations" do

    context "Absolute value" do
      it 'should be 2.0 for input -2.0'do
        calculator = Calculator.new({:state => -2.0})
        calculator.abs
        expect(calculator.state).to eq(2.0)
      end
    end

    context "Negation" do
      it 'should be -2.0 for input -2.0'do
        calculator = Calculator.new({:state => 2.0})
        calculator.neg
        expect(calculator.state).to eq(-2.0)
      end
    end
    context "Square Root" do
      it 'should be 2.0 for input 4.0'do
        calculator = Calculator.new({:state => 4.0})
        calculator.sqrt
        expect(calculator.state).to eq(2)
      end

      it 'should not throw exception for -1' do
          calculator = Calculator.new({:state => -1.0})
          expect{calculator.sqrt}.to_not raise_error
        end
      end

    context "Square" do
      it 'should be 4.0 for input 2.0'do
        calculator = Calculator.new({:state => 2.0})
        calculator.sqr
        expect(calculator.state).to eq(4.0)
      end
    end


    context "Cube" do
      it 'should be 8.0 for input 2.0'do
        calculator = Calculator.new({:state => 2.0})
        calculator.cube
        expect(calculator.state).to eq(8.0)
      end
    end

    context "Cube Root" do
      it 'should be 2.0 for input 8.0'do
        calculator = Calculator.new({:state => 8.0})
        calculator.cubert
        expect(calculator.state).to eq(2.0)
      end
    end

  end

  context "cancel" do
    it 'should reset ' do
      calculator = Calculator.new({:state => 2.0})
      calculator.cancel
      expect(calculator.state).to eq(0.0)
    end
  end
  end
