require_relative 'pairs_of_array_sum'

describe Pairs do
  subject { described_class.new(arr, k) }
  describe '#execute' do
    let(:arr) { [1,2,3,4,5,6,7,8,9,0] }
    let(:k) { 7}

    it { expect(subject.execute).to eq({0 => [4, 3], 1 => [5, 2], 2 => [6, 1], 3 => [0, 7]}) }
  end
end
