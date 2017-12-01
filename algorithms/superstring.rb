# Given a set of n strings arr[], find the smallest string that contains each string in the given set as substring. We may assume that no string in arr[] is substring of another string.



def find_overlapping(s1, s2, str)
  max = -9999999999999
  l1 = s1.length
  l2 = s2.length

  n = [l1, l2].min

  # check suffix of str1 matches with prefix of str2
  for i in 1..n
    if s1[l1-i..l1-1] ==  s2[0..i-1]
      if i > max 
        max = i
        str = s1 + s2[i..l2-1]
      end
    end
  end
  
  # check prefix of str1 matches with suffix of str2
  for i in 1..n
    if s1[0..i-1] == s2[l2-i..l2-1]
      if i > max
        max = i 
        str = s2 + s1[i..l1-1]
      end
    end
  end
  [max, str]
end

def findShortest(arr, n)
  while n != 1
    max = -9999999999999
    out = ""
    l = 0
    r = 0

    for i in 0..n-1
      for j in i+1..n-1
        str = ""
        tmp = find_overlapping(arr[i], arr[j], str)
        res = tmp[0]
        str = tmp[1]
        
        if max < res
          max = res
          out = str
          l = i
          r = j
        end
      end
    end

    n-= 1
    
    if max == -9999999999999
      arr[0] += arr[n-1] 
    else
      arr[l] = out
      arr[r] = arr[n]
    end
  end
  
  arr[0]
end



arr = ["catgc", "ctaagt", "gcta", "ttca", "atgcatc"]
findShortest(arr, arr.size)