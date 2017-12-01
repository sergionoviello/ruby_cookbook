# find the product of all element in arra
# brute force is O(n^2)

def product_all_int(arr)
  res = []
  for i in 0..arr.size - 1
    prod = 1
    for j in 0..arr.size - 1
      prod *= arr[j] if i != j
    end
    res << prod
  end
  res
end

# dynamic programming solution in O(n)

def product_all_int2(arr)
  res = []
  partial = [1]
  for i in 0..arr.size - 1
    partial[i+1] = partial[i] * arr[i] 
  end

  tmp = 1
  (arr.size-1).downto(0) do |i|
    res[i] = partial[i] * tmp
    tmp *= arr[i]
  end
  res
end

a = [1, 7, 3, 4]

p product_all_int2(a)