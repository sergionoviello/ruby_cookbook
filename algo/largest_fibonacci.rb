class LargestFibonacci
  def initialize(n, seq)
    @my_map = {}
    @dp = Array.new(20) { Array.new(20) }
    @arr = seq


    for i in 1..n do
      for j in i+1..n do
        @dp[i][j] = 1
      end
    end

    top = 0
    low = @arr[1]
    high = nil
    (n-1).downto(1).each do |i|
      for j in 1..i do
        k = @arr[i] + @arr[j]
        if (@my_map[k])
          @dp[j][i] = @dp[i][@my_map[k]] + 1
          if @dp[j][i] > top
            top = @dp[j][i]
            low = j
            high = i
          end
        end
      end
      @my_map[@arr[i]] = i
    end

    q1 = @arr[low]
    q2 = @arr[high]
    for i in 0..top
      puts q2
      t = q1
      q1 = q2
      q2 = t + q2
    end
  end
end


#lb = LargestFibonacci.new(10, [1, 1, 3, -1, 2, 0, 5, -1, -1, 8])
lb = LargestFibonacci.new(7, [1, 4, 3, 9, 10, 13, 7])


# class LargestFibonacci do
#   attr_accessor :arr, :k
#   def initialize(arr, k)
#     @arr = arr
#     @k = k
#   end
#
#   def execute
#
#   end
# end
