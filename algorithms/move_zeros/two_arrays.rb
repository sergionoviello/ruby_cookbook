# given an array with zerors
# move all zeros to the right
# it's easy if we can use 2 arrays

require 'rspec/autorun'

class MoveZeros
  def initialize(arr)
    @arr = arr
  end

  def move
    b = @arr.reject{ |x| x == 0 }
    b + (@arr - b)
  end
end

describe MoveZeros do
  subject { described_class.new(arr) }

  describe '#move' do
    let(:arr) { [5, 0, 3, 2, 0]  }

    it { expect(subject.move).to eq [5, 3, 2, 0, 0] }
  end
end