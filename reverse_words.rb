def reverse_words(str)
  res = ''
  j = 0
  str.split('').each_with_index do |c, i|
    puts c
    if c == ' '
      res << reverse(str[j..i-1], j, i-1)
      j = i + 1
      puts j, i
    end
  end
  puts res
end

def reverse(str, i, j)
  temp = str[i]
  str[i] = str[j]
  str[j] = temp
  str
end


puts reverse_words("the sky is blue")
