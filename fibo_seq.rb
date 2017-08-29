class FiboSeq
  def initialize(arr, n)
    @a = arr
    @M = arr.max
    @fib = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584]
    @max_length = 1
    p @a
    return
    @a.each_with_index do |num, i|
      if num <= @M/2
        for j in 0..i
          if (@a[i] + @a[j]) <= @M && @a[j] >= @fib[@max_length - 1]
            l = @a[j..i].length
            if l > @max_length
              @max_length = l
            end
          end
        end
      end
    end

    p @max_length
    #
    # ans = 0
    # ax = ay = @a[0]
    # n = @a.length
    # f = Array.new(20) { Array.new(20)  }
    # h = {}
    # for i in 0..n
    #   for j in (i+1)..n
    #     f[i][j] = 1
    #   end
    # end
    #
    # (n).downto(0).each do |i|
    #   (i-1).downto(0).each do |j|
    #     h
    #   end
    # end

  end
end

fib = FiboSeq.new([1, 1, 3, -1, 2, 0, 5, -1, -1, 8].sort, 10)
