# The cost of a stock on each day is given in an array, 
# find the max profit that you can make by buying and selling in those days.

# example:  [100, 180, 260, 310, 40, 535, 695]
# best option is to: 
# buy on day 0 : 100 and sell at day 3: 310 - profit 210
# buy on day 4 : 40 and sell at day 6: 695 - profit 655

# in this case we can buy and sell multiple times 

require 'rspec/autorun'

class StockProfitCalculator
  
  def initialize(arr)
    @prices = arr
  end

  def calculate
    n = @prices.size
    i = 0
    transations = []
    while i < n

      while i < n - 1 && @prices[i+1] < @prices[i]
        i += 1
      end

      return false if i == n - 1

      b = i

      i+= 1

      while i < n && @prices[i-1] < @prices[i]
        i+= 1
      end

      transations << [{'b': b, 's': i-1}]
    end
    transations
  end
end

describe StockProfitCalculator do
  subject { described_class.new(arr) }

  describe '#maxprofix' do
    let(:arr) { [100, 180, 260, 310, 40, 535, 695] }
    
    it { expect(subject.calculate.count).to eq(2) }
    it { expect(subject.calculate[0]).to eq( [{'b': 0, 's': 3}] ) }
    it { expect(subject.calculate[1]).to eq( [{'b': 4, 's': 6}] ) }
  
    context 'when no profit is possible' do
      let(:arr) { [5, 4, 3, 2, 1] }

      it { expect(subject.calculate).to eq false }
    end

  end
end




