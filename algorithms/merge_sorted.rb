a = [3, 4, 6, 10, 11, 15]
b = [1, 5, 8, 12, 14, 19]


def merge_arrays(a, b)
  res = []
  if a[0] < b[0]
    res << a.shift
  else
    res << b.shift
  end

  if a.length == 0
    return res + b
  elsif b.length == 0
    return res + a
  else
    return res + merge_arrays(a, b)
  end
end

#puts merge_arrays(a, b)

def merge2(a, b)
  [].tap do |combined|
    i1, i2 = a.each, b.each
    loop { combined << (i1.peek <= i2.peek ? i1 : i2).next}
    loop { combined << i1.next }
    loop { combined << i2.next }
  end
end

puts merge2(a, b)
