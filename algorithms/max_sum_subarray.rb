class MaxSumSubArray
  attr_accessor :arr, :k

  def initialize(arr, k)
    @arr = arr
    @k = k
  end

  def max_sum
    return nil if @k > @arr.size
    max = 0
    max = sum_elements_in_array(@arr[0..(@k - 1)])
    for i in 1..@arr.length do
      left = @arr[i - 1]
      right = @arr[i + @k - 1].nil? ? 0 : @arr[i + @k - 1]
      sum = max - left + right
      max = sum if sum > max
    end

    max
  end

  private

  def sum_elements_in_array(arr)
    sum = 0
    arr.each {|e| sum += e }
    sum
  end
end


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
