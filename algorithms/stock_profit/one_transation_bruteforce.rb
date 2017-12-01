# The cost of a stock on each day is given in an array, 
# find the max profit that you can make by buying and selling in those days.

# example:  2, 3, 10, 6, 4, 8, 1
# best option is to: 
# buy on day 0 : 2 and sell at day 2: 10

# in this case we can buy and sell only once

require 'rspec/autorun'

class StockProfitCalculator
  def initialize(arr)
    @prices = arr
  end

  def calculate
    max = -99999
    n = @prices.size

    for i in 0..n - 1
      for j in i+1..n - 1
        max = @prices[j] - @prices[i] if @prices[j] - @prices[i] > max
      end
    end
    max 
  end
end

describe StockProfitCalculator do
  subject { described_class.new(arr) }

  describe '#maxprofix' do
    let(:arr) { [2, 3, 10, 6, 4, 8, 1] }
    
    it { expect(subject.calculate).to eq(8) }
  
    context 'when no profit is possible' do
      let(:arr) { [5, 4, 3, 2, 1] }

      it { expect(subject.calculate).to be <= 0 }
    end
  end
end






