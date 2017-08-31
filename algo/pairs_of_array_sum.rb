# class Pairs
#   attr_accessor :arr_a, :k, :arr_b
#   def initialize(arr_a, k, arr_b = nil)
#     @arr_a = arr_a
#     @k = k
#     @arr_b = arr_b
#   end
#
#   def num_of_pairs
#     bitmap = {}
#     pairs = {}
#     cnt = 0
#     for i in 0..(@arr_a.length - 1)
#       temp = @k - @arr_a[i]
#       if temp >= 0  && bitmap[temp]
#         pairs[cnt] = [@arr_a[i], temp]
#         cnt += 1
#       end
#       bitmap[@arr_a[i]] = true
#     end
#     pairs
#   end
#
#   def num_of_pairs_from_both_arrays
#     bitmap = {}
#     pairs = {}
#     cnt = 0
#     for i in 0..@arr_a.length - 1
#       bitmap[@arr_a[i]] = true
#     end
#
#     for i in 0..@arr_b.length - 1
#       if bitmap[@k-@arr_b[i]] == true
#         pairs[cnt] = [@arr_b[i], @k-@arr_b[i]]
#         cnt += 1
#       end
#     end
#     pairs
#   end
# end
#
# a = [1,2,3,4,5,6,7,8,9,0]
# pairs = Pairs.new(a, 7)
# puts pairs.num_of_pairs
# puts
# A = [-1, -2, 4, -6, 5, 7]
# B = [6, 3, 4, 0]
# pairs = Pairs.new(A, 8, B)
# puts pairs.num_of_pairs_from_both_arrays
#
# puts
#
# C = [1, 2, 4, 5, 7]
# D = [5, 6, 3, 4, 8]
# pairs = Pairs.new(C, 9, D)
# puts pairs.num_of_pairs_from_both_arrays


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
