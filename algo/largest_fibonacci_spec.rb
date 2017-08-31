require_relative 'largest_fibonacci'

describe LargestFibonacci do
  subject { described_class.new(k, arr) }
  
  describe '#execute' do
    let(:arr) { [1, 4, 3, 9, 10, 13, 7] }
    let(:k) { 7 }
  end
end
