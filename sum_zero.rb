class SumZero
  attr_accessor :arr

  def initialize(arr)
    @arr = arr
    @k = 3
  end

  def sum_zero
    res = []
    @arr.combination(@k) do |sub|
      sum = sum_elements(sub)
      res << sub if sum == 0
    end
    res
  end

  def sum_elements(arr)
    sum = 0
    arr.each {|x| sum += x}
    sum
  end
end


sumzero = SumZero.new([0, -1, 2, -3, 1])
p sumzero.sum_zero
