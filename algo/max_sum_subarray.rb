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
