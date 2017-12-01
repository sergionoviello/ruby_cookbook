

def is_match(str, patt)
  n = str.size 
  m = patt.size

  lookup = Array.new(n+1) { Array.new(m+1) }

  for i in 0..n
    lookup[i][0] = false
  end

  lookup[0][0] = true

  for j in 1..m
    lookup[0][j] = lookup[0][j - 1] 
  end

  for i in 1..n
    for j in 1..m
      if patt[j-1] == '*'
        lookup[i][j] = lookup[i-1][j] || lookup[i][j-1]
      elsif str[i-1] == patt[j-1]
        lookup[i][j] = lookup[i-1][j-1]
      else
        lookup[i][j] = false
      end
    end
  end
  lookup[n][m]
end


str = "baaabab"
patt = "ba*ab"
p is_match(str, patt)