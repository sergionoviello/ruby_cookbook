# merge 2 sorted arrays in a new sorted one

def merge_sorted(a1, a2)
  i = 0
  j = 0
  k = 0
  n1 = a1.size
  n2 = a2.size
  a3 = []

  while i < n1 && j < n2
    if a1[i] < a2[j]
      a3[k] = a1[i]
      i+= 1
    else
      a3[k] = a2[j]
      j+= 1
    end
    k += 1
  end

  while i < n1
    a3[k] = a1[i]
    i+= 1
    k+= 1
  end

  while j < n2
    a3[k] = a2[j]
    j+= 1
    k+= 1
  end
  a3
end

a1 = [1, 3, 4, 5]
a2 = [2, 4, 6, 8]

p merge_sorted(a1, a2)