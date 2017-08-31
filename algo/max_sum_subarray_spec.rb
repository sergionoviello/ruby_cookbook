require_relative 'max_sum_subarray'

describe MaxSumSubArray do
  subject { described_class.new(arr, k) }

  let(:k) { 2 }
  let(:arr) { [100, 200, 300, 400] }

  describe '#max_sum' do
    it { expect(subject.max_sum).to eq(700) }

    context 'when k is 4' do
      let(:arr) { [1, 4, 2, 10, 23, 3, 1, 0, 20] }
      let(:k) { 4 }

      it { expect(subject.max_sum).to eq(39) }
    end

    context 'when k is > than arr size' do
      let(:arr) { [1, 2] }
      let(:k) { 3 }

      it { expect(subject.max_sum).to eq(nil) }
    end
  end
end
