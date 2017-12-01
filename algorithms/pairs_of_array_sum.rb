class Pairs
  attr_accessor :arr_a, :k
  def initialize(arr_a, k)
    @arr_a = arr_a
    @k = k
  end

  def execute
    h = {}
    res = {}
    cnt = 0
    for i in 0..@arr_a.length - 1
      temp = @k - @arr_a[i]

      if h[temp] == true
        res[cnt] = [@arr_a[i], temp]
        #p "#{@k}, #{@arr_a[i]}, #{temp}"
        cnt+= 1
      end

      h[@arr_a[i]] =  true
    end

    res
  end
end

describe Pairs do
  subject { described_class.new(arr, k) }
  describe '#execute' do
    let(:arr) { [1,2,3,4,5,6,7,8,9,0] }
    let(:k) { 7}

    it { expect(subject.execute).to eq({0 => [4, 3], 1 => [5, 2], 2 => [6, 1], 3 => [0, 7]}) }
  end
end
