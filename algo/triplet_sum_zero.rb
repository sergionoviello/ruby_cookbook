def triplet_sum_zero(arr)
  found = false
  n = arr.size
  for i in 0..n-2
    l = i + 1
    r = n - 1
    x = arr[i]

    while l < r
      if x + arr[l] + arr[r] == 0
        print "#{x} #{arr[l]} #{arr[r]}"
        puts
        found = true
        l+=1
        r-=1
      elsif x + arr[l] + arr[r] < 0
        l+=1
      else
        r-=1
      end
    end
  end
  unless found
    print "none"
  end
end


a = [0, -1, 2, -3, 1]
print triplet_sum_zero(a.sort)
