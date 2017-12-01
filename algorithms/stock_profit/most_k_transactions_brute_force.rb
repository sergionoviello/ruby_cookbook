# calculate the max profix fo buying and selling stocks
# with more than 1 transaction but at most k transations 

# we can use a matrix that we call profit_table kxn where each element
# is the max profit using k transaction up to the nth day

# for example profit_table[0][0] is the max profit using 0 transactions
# up to the 0th day 

# beause with [0][0] we can't have profit we need to fill the left and top border of the matrix with zeros

# 0 0 0 0 
# 0 ? ? ?
# 0 ? ? ?
# 0 ? ? ?

# we need to calculate profit_table[ith_transaction][ith_day] to fill up the table
# for example profit_table[1][1] is the max profit using 1 transactions
# up to the 1th day. the max profit is the max between the local profit :
#buy price on day from 0 - sale price on day 1 + profit of 1less transaction : profit_table[kth_transaction-1][ith day] 
#once we find this max we need to find the max bewtween this and the max profit on the ithday -1 profit_table[kth_transactions][ith_day -1]

# complaxity O(days^2 * transactions)


require 'rspec/autorun'

class StockPriceCalculator
  def initialize(arr, num_transactions)
    @prices = arr
    @num_transactions = num_transactions
    @num_days = arr.size
  end

  def max_profit
    profit_table = Array.new(@num_transactions + 1 ) { Array.new(@num_days ) { 0 } }
    
    for kth_transaction in 1..@num_transactions 
      
      for ith_day in 1..@num_days - 1
        max = -9999

        for w in 0..ith_day - 1
          max = [max, @prices[ith_day] - @prices[w] + profit_table[kth_transaction-1][w] ].max
        end

        profit_table[kth_transaction][ith_day] = [max, profit_table[kth_transaction][ith_day-1]].max
      end
    end
    summary(profit_table)
    profit_table[@num_transactions][@num_days - 1]
  end

  def summary(profit_table)
    n = profit_table[@num_transactions].size-1
    summary = []
    while n > 0
      n-=1 and next if profit_table[@num_transactions][n] == profit_table[@num_transactions][n-1]
      sday = n
      diff = profit_table[@num_transactions][n] - @prices[n]
      
      (n-1).downto(0) do |c|
        if profit_table[@num_transactions][c] - @prices[c] == diff
          summary << [{'b': c, 's': sday}]
          break
        end
      end
      n-=1
    end 

    p summary
  end
end


describe StockPriceCalculator do
  subject { described_class.new(prices, num_transactions) }

  describe '#max_profit' do
    context 'when k is 2' do
      let(:prices) { [10, 22, 5, 75, 65, 80] }
      let(:num_transactions) { 2 }

      it { expect(subject.max_profit).to eq 87 }
    end

    context 'when k is 3' do
      let(:prices) { [12, 14, 17, 10, 14, 13, 12, 15] }
      let(:num_transactions) { 3 }
      
      it { expect(subject.max_profit).to eq 12 }
    end

    context 'when k is 1' do
      let(:prices) { [90, 80, 70, 60, 50] }
      let(:num_transactions) { 1 }
      
      it { expect(subject.max_profit).to eq 0 }
    end
  end
end

