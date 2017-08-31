require_relative 'array_operation'

describe ArrayOperation do
  subject { described_class.new(arr) }

  let(:arr) { [] }

  describe '#binary_search' do
    let(:arr) { [1, 3, 5, 2, 6, 8] }

    it { expect(subject.binary_search(3)).to eq(1) }
  end

  describe '#bubble_sort' do
    let(:arr) { [21, 15, 8] }

    it { expect(subject.bubble_sort).to eq([8, 15, 21]) }
  end

  describe '#quick_sort' do
    let(:arr) { [21, 15, 8, 4, 9] }

    it { expect(subject.quicksort).to eq([4, 8, 9, 15, 21]) }
  end

  describe '#not_in_place_quick_sort' do
    let(:arr) { [21, 15, 8, 4, 9] }

    it { expect(subject.notinplacequicksort).to eq([4, 8, 9, 15, 21]) }
  end

  describe '#mergesort' do
    let(:arr) { [21, 15, 8, 4, 9] }

    it { expect(subject.mergesort).to eq([4, 8, 9, 15, 21]) }
  end

end
