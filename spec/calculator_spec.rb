require 'calculator'

describe "Calculator" do

  let(:calc){ Calculator.new }
  let(:true_calc){ Calculator.new(true) }

  describe "#add method" do

    it "adds two positive numbers" do
      expect(calc.add(1,4)).to eq(5)
    end

    it "adds two negative numbers" do
      expect(calc.add(-2,-6)).to eq(-8)
    end

    it "adds a positive and negative number" do
      expect(calc.add(-2,5)).to eq(3)
    end

    it "adds floating point numbers" do
      expect(calc.add(2.0, 3.5)).to eq(5.5)
    end

  end

  describe "#subtract method" do

    it "subtracts two positive numbers" do
      expect(calc.subtract(5,2)).to eq(3)
    end

    it "subtracts two negative numbers" do
      expect(calc.subtract(-2, -3)).to eq(1)
    end

    it "subtracts two floating point numbers" do
      expect(calc.subtract(5.5, 3.5)).to eq(2.0)
    end

  end

  describe "#multiply method" do

    it "multiplies two numbers" do
      expect(calc.multiply(6,3)).to eq(18)
    end

  end

  describe "#divide method" do

    it "divides two numbers" do
      expect(calc.divide(24,8)).to eq(3)
    end

    it "raises error if 2nd argument is zero" do
      expect {calc.divide(5,0)}.to raise_error(ArgumentError)
    end

    it "returns integer if there's no remainder" do
      expect(calc.divide(35,7)).to be_an(Integer)
    end

    it "returns a float if there's a remainder" do
      expect(calc.divide(28,5)).to be_a(Float)
    end

  end

  describe "#pow method" do

    it "raises a number to nth power" do
      expect(calc.pow(2,3)).to eq(8)
    end

    it "raises a number to a negative power" do
      expect(calc.pow(2,-3)).to eq(0.125)
    end

    it "raises a number to a decimal power" do
      expect(calc.pow(2, 3.5)).to eq(11.313708498984761)
    end

  end

  describe "#sqrt method" do

    it "determines square root for positive number" do
      expect(calc.sqrt(25)).to eq(5)
    end

    it "raises an error for negative inputs" do
      expect { calc.sqrt(-5) }.to raise_error(ArgumentError)
    end

    it "returns integers for round roots" do
      expect(calc.sqrt(49)).to be_an(Integer)
    end

    it "returns 2-digit decimals non-round roots" do
      expect(calc.sqrt(15)).to eq(3.87)
    end

  end

  describe "#memory= method" do

    it "stores an object in memory" do
      test_obj = 34
      calc.instance_variable_set(:@memory, test_obj)
      expect(calc.memory).to eq(test_obj)
    end

  end

  describe "#memory method" do

    it "returns obj in memory" do
      test_obj = 34
      calc.memory = test_obj
      expect(calc.memory).to eq(test_obj)
    end

    it "clears memory after returning object" do
      calc.memory = 34
      calc.memory
      expect(calc.memory).to eq(nil)
    end

  end

  describe "#stringify method" do

    it "returns a string" do
      expect(true_calc.add(1,4)).to be_a(String)
    end

  end

end
