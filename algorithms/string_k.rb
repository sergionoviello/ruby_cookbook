# given a string and a segmentation length k 
# For example: 
# "This is a good day" k = 10 
# Cut into: 
# "This (1/4)" 
# "is a (2/4)" 
# "good (3/4)" 
# "day (4/4)" 
# Each line followed by a suffix in the form of (i/n) has 10 chars including space (except for the last line), 
# return the minimum cut required, for the example, just return 4.

# how many time I have to split a string to get each segment of length k including a suffix (i/n) except the last one


def segCount(str, k)
  # init {1/1}
  base = 9
  segLen = [5]
  numOfSegs = [1]
  len = str.length
  i = 0
  count = 0
  while (k - segLen[i] > 0)
    
    while (numOfSegs[i] < base && len > k - segLen[i])
      
      numOfSegs[i] += 1
      len -= k - segLen[i]

    end

    count += numOfSegs[i]

    return count if len <= k - segLen[i]

    base *= 10
    segLen.push( segLen[i] + 1 )
    numOfSegs.push( numOfSegs[i] + 1 )

    i+= 1
  end
  -1 
end





p segCount("this is a cat",  8)




