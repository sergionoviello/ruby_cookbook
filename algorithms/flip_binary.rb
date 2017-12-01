  # given a binary array, you can flip 0 to 1 and
  # 1 to 0 in order to have all 1 to the left and 0 to the right
  # return the min number of flips


def flip(arr)
  left_flips = []
  right_flips = []
  flips = 0

  (0..(arr.size - 1)).step(1) do |i|
    flips += 1 if arr[i] == 0
    left_flips[i] = flips
  end

  flips = 0
  (arr.size - 1).downto(0) do |i| 
    flips += 1 if arr[i] == 1
    right_flips[i] = flips
  end

  min = 99999999999

  for i in 1..arr.size - 1
    j = arr.size - i - 1

    if left_flips[i] + right_flips[j] < min
      min = left_flips[i] + right_flips[j]
    end
  end

  
  min
end

a = [1, 0, 1, 1, 0, 0, 0]
p flip(a)

# b = [1,0,1,1,0,0,0,0]
# p flip(b)

# c = [1, 0, 0, 0]
# p flip(c)