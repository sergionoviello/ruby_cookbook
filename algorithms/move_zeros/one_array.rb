# given an array with zerors
# move all zeros to the right without using a second array

# with one array we use 2 indices: i, k.
# we increase k when the element is not zero and we swap i and k

require 'rspec/autorun'

class MoveZeros
  def initialize(arr)
    @arr = arr
  end

  def move 
    k = 0 
    for i in 0..@arr.size - 1
      if @arr[i] != 0
        @arr[k], @arr[i] = @arr[i], @arr[k]
        k += 1
      end
    end
    @arr
  end
end

describe MoveZeros do
  subject { described_class.new(arr) }

  describe '#move' do
    let(:arr) { [5, 0, 3, 2, 0]  }

    it { expect(subject.move).to eq [5, 3, 2, 0, 0] }

    context 'when zeros are already on the right' do
      let(:arr) { [5, 3, 2, 0, 0] }

      it { expect(subject.move).to eq [5, 3, 2, 0, 0] }
    end

    context 'when we have no zeros' do
      let(:arr) { [5, 3, 2, 8, 2] }

      it { expect(subject.move).to eq [5, 3, 2, 8, 2] }
    end
  end
end