def fibonacci(num)
  a = 1
  b = 0
  while (num >= 0)
    temp = a
    a = a + b
    b = temp
    num -= 1
  end
  b
end


p fibonacci(5)
