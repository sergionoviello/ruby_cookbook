# Given a rod of length n inches and an array of prices 
# that contains prices of all pieces of size smaller than n. 
# Determine the maximum value obtainable by cutting up the rod and selling the pieces.

require 'rspec/autorun'

class CuttinRod

  def initialize(arr)
    @arr = arr
  end

  def cut(a, n)
    return 0 if n == 0
    max = -999999

    for i in 0..n-1
      max = [max, a[i] + cut(a, n - i - 1) ].max
    end
    max
  end

end

describe CuttinRod do
  subject { described_class.new(arr) }

  describe '#cut' do
    let(:arr) { [1, 5, 8, 9, 10, 17, 17, 20] }

    it { expect(subject.cut(arr, arr.size)).to eq 22 }
  end

end

