require 'rails_helper'

describe Operations do

  it 'should call calculators add function' do
    operations = Operations.new("add",5)
    calculator = Calculator.new({:state=>0})
    expect(calculator).to receive(:+).with(5)
    operations.operate(calculator)
  end
  it 'should call calculators subtract function' do
    operations = Operations.new("sub",5)
    calculator = Calculator.new({:state=>0})
    expect(calculator).to receive(:-).with(5)
    operations.operate(calculator)
  end
  it 'should call calculators multiply function' do
    operations = Operations.new("multiply",5)
    calculator = Calculator.new({:state=>0})
    expect(calculator).to receive(:*).with(5)
    operations.operate(calculator)
  end
  it 'should call calculators divide function' do
    operations = Operations.new("divide",5)
    calculator = Calculator.new({:state=>0})
    expect(calculator).to receive(:/).with(5)
    operations.operate(calculator)
  end
  it 'should call calculators sqr function' do
    operations = Operations.new("sqr")
    calculator = Calculator.new({:state=>0})
    expect(calculator).to receive(:sqr)
    operations.operate(calculator)
  end
  it 'should call calculators sqrt function' do
    operations = Operations.new("sqrt")
    calculator = Calculator.new({:state=>0})
    expect(calculator).to receive(:sqrt)
    operations.operate(calculator)
  end
  it 'should call calculators cube function' do
    operations = Operations.new("cube")
    calculator = Calculator.new({:state=>0})
    expect(calculator).to receive(:cube)
    operations.operate(calculator)
  end
  it 'should call calculators cubert function' do
    operations = Operations.new("cubert")
    calculator = Calculator.new({:state=>0})
    expect(calculator).to receive(:cubert)
    operations.operate(calculator)
  end
  it 'should call calculators neg function' do
    operations = Operations.new("neg")
    calculator = Calculator.new({:state=>0})
    expect(calculator).to receive(:neg)
    operations.operate(calculator)
  end
  it 'should call calculators cancel function' do
    operations = Operations.new("cancel")
    calculator = Calculator.new({:state=>0})
    expect(calculator).to receive(:cancel)
    operations.operate(calculator)
  end
  it 'should call calculators abs function' do
    operations = Operations.new("abs")
    calculator = Calculator.new({:state=>0})
    expect(calculator).to receive(:abs)
    operations.operate(calculator)
  end
context "Equality checks" do
      let(:operations) do
        Operations.new("add",5)
      end
      it "should be equal for same object id" do
        expect(operations).to eq(operations)
      end

      it "should not be null" do
        expect(operations).to_not eq(nil)
      end

      it "should not be equal for different type" do
        object = Object.new
        expect(operations).to_not eq(object)
      end

      it "should have same hash code" do
        operations1 = Operations.new("add",5)
        operations2 = Operations.new("add",5)
        expect(operations1.hash).to eq(operations2.hash)
      end

      it "symmetric property" do
        operations1 = Operations.new("add",5)
        operations2 = Operations.new("add",5)
        expect(operations1).to eq(operations2) and expect(operations2).to eq(operations1)
      end

      it "transitive property" do
        operations1 = Operations.new("add",5)
        operations2 = Operations.new("add",5)
        operations3 = Operations.new("add",5)
        expect(operations1).to eq(operations2) and expect(operations2).to eq(operations3) and expect(operations3).to eq(operations1)
      end
end

end