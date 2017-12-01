# given an array find pairs that satisfy 
# the condition a[j] = a[i] + 1

def find_pairs(a)
  pairs = []

  for i in 0..a.size - 1
    (a.size - 1).downto(0) do |j|
      if a[j] == a[i] + 1
        pairs << [i, j]
        break
      end
    end
  end
  pairs
end 

def find_pairs2(a)
  cache = {}
  res = []
  for i in 0..(a.size - 1)
    cache[a[i]] = i
  end
  
  i = 0
  for k in a
    if cache.key?(k + 1)
      j = cache[k + 1]
      res << [i, j]
    end
    i += 1
  end
  res
end


a = [5, 4, 1, 3, 2, 2, 3];
p find_pairs2(a)