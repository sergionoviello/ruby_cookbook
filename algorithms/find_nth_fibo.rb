# given n find the nth fibonacci number

# the exponential solution is to use recursion


def fibo(n)
  return n if n <= 1
  return fibo(n-1) + fibo(n-2)
end

p fibo(9)

# an improvememnt is to use memoization by storing 
# numbers already calculated
# Time Complexity: O(n)
# Extra Space: O(n)

def fib2(n, fib_cache) 
  
  if n == 0 || n == 1
    return fib_cache[n]
  elsif n <= fib_cache.size
    return fib_cache[n-1]
  else 
    res = fib2(n-1, fib_cache) + fib2(n-2, fib_cache)
    fib_cache.push(res)
    return res
  end
end

p fib2(6, [0, 1])