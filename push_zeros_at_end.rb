def push_zeros(arr)
  tmp = arr - [0]
  zeros = Array.new(arr.size - tmp.size) { 0 }
  tmp.concat(zeros)
end


p push_zeros([1, 2, 3, 0, 2, 4, 0, 9])
#p push_zeros([0, 0, 0, 1, 0, 0, 0])
